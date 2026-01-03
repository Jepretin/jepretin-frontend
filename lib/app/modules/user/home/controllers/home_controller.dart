import 'package:flutter/material.dart';
import 'package:jepretin/app/core/helper/token_manager.dart';
import 'package:jepretin/app/core/helper/address_helper.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/data/models/territory_model.dart';
import 'package:jepretin/app/data/services/provider_service.dart';
import 'package:jepretin/app/data/services/territory_service.dart';
// import 'package:jepretin/app/data/models/provider_model.dart';
// import 'package:jepretin/app/data/services/imagekit_endpoint.dart';
// import 'package:jepretin/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController implements AddressSelectable {
  final addressDetailController = TextEditingController();
  final _provinceController = TextEditingController();
  final _regencyController = TextEditingController();
  final _districtController = TextEditingController();
  final _villageController = TextEditingController();

  @override
  TextEditingController get provinceController => _provinceController;

  @override
  TextEditingController get regencyController => _regencyController;

  @override
  TextEditingController get districtController => _districtController;

  @override
  TextEditingController get villageController => _villageController;

  final isLoading = false.obs;
  final isLoggedIn = false.obs;
  final isCoverage = false.obs; // True = wilayah ter-cover
  final coverageData = {}.obs; // Simpan info coverage jika ada
  final isPrimary = false.obs;
  final isAddingAddress = false.obs;

  // Selected IDs
  final selectedProvinceId = ''.obs;
  final selectedRegencyId = ''.obs;
  final selectedDistrictId = ''.obs;
  final selectedVillageId = ''.obs;

  // Lists
  RxList<ProvinceModel> provinces = <ProvinceModel>[].obs;
  RxList<RegencyModel> regencies = <RegencyModel>[].obs;
  RxList<DistrictModel> districts = <DistrictModel>[].obs;
  RxList<VillageModel> villages = <VillageModel>[].obs;

  final providerList = <Map<String, dynamic>>[].obs;
  final RxList<AddressModel> addressList = <AddressModel>[].obs;
  final RxString primaryDistrictId = ''.obs;
  final isProviderLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
    checkCheck();
    fetchAddresses();
  }

  // Cek token dari penyimpanan lokal
  void checkCheck() async {
    final token = await TokenManager.getToken();
    print("🔥 TOKEN SEKARANG: $token");

    final uid = await TokenManager.getUserId();
    print("🔥 USERID SEKARANG: $uid");
  }

  // Cek apakah user sudah login
  void checkLoginStatus() async {
    final loggedIn = await TokenManager.isLoggedIn();
    isLoggedIn.value = loggedIn;
    print("🔐 Status login: $loggedIn");
  }

  Future<List<ProvinceModel>> searchProvinces(String q) async {
    // Panggil API kalau list masih kosong
    if (provinces.isEmpty) {
      final res = await TerritoryService.getProvinces();
      res.fold(
        (_) {},
        (data) => provinces.assignAll(data.data ?? []),
      );
    }

    // Baru lakukan filter
    if (q.isEmpty) return provinces;
    return provinces
        .where((p) => p.name.toLowerCase().contains(q.toLowerCase()))
        .toList();
  }

  Future<List<RegencyModel>> searchRegencies(String q) async {
    if (selectedProvinceId.value.isEmpty) return [];

    if (regencies.isEmpty) {
      final res = await TerritoryService.getRegencies(selectedProvinceId.value);
      res.fold(
        (_) {},
        (data) => regencies.assignAll(data.data ?? []),
      );
    }

    if (q.isEmpty) return regencies;
    return regencies
        .where((r) => r.name.toLowerCase().contains(q.toLowerCase()))
        .toList();
  }

  Future<List<DistrictModel>> searchDistricts(String q) async {
    if (selectedRegencyId.value.isEmpty) return [];

    if (districts.isEmpty) {
      final res = await TerritoryService.getDistricts(selectedRegencyId.value);
      res.fold(
        (_) {},
        (data) => districts.assignAll(data.data ?? []),
      );
    }

    if (q.isEmpty) return districts;
    return districts
        .where((d) => d.name.toLowerCase().contains(q.toLowerCase()))
        .toList();
  }

  Future<List<VillageModel>> searchVillages(String q) async {
    if (selectedDistrictId.value.isEmpty) return [];

    if (villages.isEmpty) {
      final res = await TerritoryService.getVillages(selectedDistrictId.value);
      res.fold(
        (_) {},
        (data) => villages.assignAll(data.data ?? []),
      );
    }

    if (q.isEmpty) return villages;
    return villages
        .where((v) => v.name.toLowerCase().contains(q.toLowerCase()))
        .toList();
  }

  @override
  Future<List> search(AddressLevel level, String q) {
    switch (level) {
      case AddressLevel.province:
        return searchProvinces(q);
      case AddressLevel.regency:
        return searchRegencies(q);
      case AddressLevel.district:
        return searchDistricts(q);
      case AddressLevel.village:
        return searchVillages(q);
    }
  }

  @override
  void select(AddressLevel level, dynamic item) {
    switch (level) {
      case AddressLevel.province:
        onProvinceSelected(item as ProvinceModel);
        break;
      case AddressLevel.regency:
        onRegencySelected(item as RegencyModel);
        break;
      case AddressLevel.district:
        onDistrictSelected(item as DistrictModel);
        break;
      case AddressLevel.village:
        onVillageSelected(item as VillageModel);
        break;
    }
  }

  void onProvinceSelected(ProvinceModel province) {
    selectedProvinceId.value = province.id;

    selectedRegencyId.value = '';
    selectedDistrictId.value = '';
    selectedVillageId.value = '';

    regencies.clear();
    districts.clear();
    villages.clear();

    print("➡ Province selected: ${province.name}");
  }

  void onRegencySelected(RegencyModel regency) {
    selectedRegencyId.value = regency.id;

    selectedDistrictId.value = '';
    selectedVillageId.value = '';

    districts.clear();
    villages.clear();

    print("➡ Regency selected: ${regency.name}");
  }

  void onDistrictSelected(DistrictModel district) {
    selectedDistrictId.value = district.id;

    selectedVillageId.value = '';
    villages.clear();

    print("➡ District selected: ${district.name}");
  }

  void onVillageSelected(VillageModel village) {
    selectedVillageId.value = village.id;
    print("➡ Village selected: ${village.name}");
  }

  Future<void> loadProvinces() async {
    try {
      // contoh: provinces.value = await ApiService.getProvinces();
      print("Provinces loaded: ${provinces.length}");
    } catch (e) {
      print("Error loading provinces: $e");
    }
  }

  Future<void> loadRegencies(String provinceId) async {
    try {
      // regencies.value = await ApiService.getRegencies(provinceId);
      print("Regencies loaded: ${regencies.length}");
    } catch (e) {
      print("Error loading regencies: $e");
    }
  }

  Future<void> loadDistricts(String regencyId) async {
    try {
      // districts.value = await ApiService.getDistricts(regencyId);
      print("Districts loaded: ${districts.length}");
    } catch (e) {
      print("Error loading districts: $e");
    }
  }

  Future<void> loadVillages(String districtId) async {
    try {
      // villages.value = await ApiService.getVillages(districtId);
      print("Villages loaded: ${villages.length}");
    } catch (e) {
      print("Error loading villages: $e");
    }
  }

  // Mengambil data Customer Address
  Future<void> fetchAddresses() async {
    try {
      isLoading.value = true;
      print("🔄 Fetching user addresses...");

      final res = await TerritoryService
          .getAllAddress(); // pastikan service return ApiResponse<List<AddressModel>>

      res.fold(
        (l) {
          print("❌ Error fetch addresses: ${l.message}");
          addressList.clear();
        },
        (r) {
          final list = r.data ?? <AddressModel>[];
          addressList.assignAll(list);
          print("✅ Loaded ${addressList.length} addresses");

          // Cari primary address
          AddressModel? primary;

          if (addressList.isNotEmpty) {
            primary = addressList.firstWhere(
              (a) => a.isPrimary == true,
              orElse: () => addressList.first,
            );
          } else {
            primary = null;
          }

          final districtId = primary?.village!.district?.id;
          print("📌 primary districtId: $districtId");

          if (districtId != null && districtId.isNotEmpty) {
            // simpan optional
            primaryDistrictId.value = districtId;
            // langsung fetch provider coverage menggunakan fungsi yang sudah ada di HomeController
            fetchProviderCoverage(districtId);
          } else {
            print("⚠️ districtId tidak tersedia di primary address");
          }
        },
      );
    } catch (e) {
      print("❌ Exception fetchAddresses: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void onTapAddress(String addr) =>
      Get.snackbar("Alamat Dipilih", addr, snackPosition: SnackPosition.BOTTOM);

  void onLongPressAddress(String addr) =>
      Get.snackbar("Alamat Diklik Lama", addr,
          snackPosition: SnackPosition.BOTTOM);

  // SELECT VILLAGE
  void selectVillage(VillageModel village) {
    selectedVillageId.value = village.id;

    final districtId = village.district?.id;

    print("✅ Village selected: ${village.name}");
    print("📌 villageId = ${village.id}");
    print("📌 districtId = $districtId");

    if (districtId != null) {
      fetchProviderCoverage(districtId);
    }
  }

  Future<void> addAddress() async {
    isLoading.value = true;

    try {
      // 🔥 Ambil userId dari TokenManager
      final String? userId = await TokenManager.getUserId();

      print("🔍 [DEBUG] userId dari TokenManager: $userId");

      // Jika null → user belum login / penyimpanan salah
      if (userId == null || userId.isEmpty) {
        Get.snackbar("Gagal", "User belum login.");
        return;
      }

      // Validasi village dipilih
      if (selectedVillageId.value.isEmpty) {
        Get.snackbar("Gagal", "Pilih desa/kelurahan terlebih dahulu.");
        return;
      }

      // Validasi detail alamat
      if (addressDetailController.text.trim().isEmpty) {
        Get.snackbar("Gagal", "Detail alamat tidak boleh kosong.");
        return;
      }

      final request = AddressRequest(
        villageId: selectedVillageId.value,
        addressDetail: addressDetailController.text.trim(),
        isPrimary: isPrimary.value,
      );
      print("📦 [REQUEST ADD ADDRESS] ${request.toJson()}");

      final res = await TerritoryService.addAddress(request);

      res.fold(
        (l) {
          if (l.statusCode == 409) {
            Get.snackbar("Tambah Alamat Gagal", "Alamat sudah terdaftar.");
          } else {
            Get.snackbar("Gagal", l.message ?? "Terjadi kesalahan server");
          }
        },
        (r) async {
          Get.snackbar("Sukses", "Alamat berhasil ditambahkan ✅");
          addressDetailController.clear();
          selectedVillageId.value = '';
          isPrimary.value = true;
          fetchAddresses();
        },
      );
    } catch (e) {
      print("❌ Exception saat tambah alamat: $e");
      Get.snackbar("Error", "Terjadi kesalahan tak terduga.");
    } finally {
      isLoading.value = false;
    }
  }

  // FETCH PROVIDER COVERAGE
  Future<void> fetchProviderCoverage(String districtId) async {
    try {
      isLoading.value = true;
      print("🔍 [CHECK COVERAGE] districtId: $districtId");

      final res = await ProviderService.getCoverageByDistrict(districtId);

      res.fold(
        (l) {
          print("❌ [CHECK COVERAGE] Error: ${l.message}");
          isCoverage.value = false;
        },
        (r) {
          print("✅ [COVERAGE] Berhasil ambil coverage!");
          print("📦 [COVERAGE DATA] ${r.data}");
          isCoverage.value = true;
          coverageData.value = (r.data as Map<String, dynamic>? ?? {});
          // coverageData.value = (r.data is Map)
          // ? Map<String, dynamic>.from(r.data)
          // : {};
        },
      );
    } catch (e) {
      print("❌ Exception Coverage: $e");
      isCoverage.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  void goToProfile() {
    if (isLoggedIn.value) {
      Get.toNamed('/profile');
    } else {
      Get.snackbar("Akses Ditolak", "Silakan login terlebih dahulu");
    }
  }

  void goToCart() {
    Get.toNamed('/cart');
    print("Pindah ke halaman Cart");
  }

  void goToNotif() {
    Get.toNamed('/mainp');
    print("Pindah ke halaman notifikasi");
  }

  @override
  void onClose() {
    addressDetailController.dispose();
    super.onClose();
  }
}
