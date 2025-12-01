import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jepretin/app/data/core/helper/token_manager.dart';
import 'package:jepretin/app/data/core/helper/address_helper.dart';
import 'package:jepretin/app/data/models/territory_model.dart';
import 'package:jepretin/app/data/request/territory_service.dart';
import 'package:jepretin/app/shared/customButton.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/themes/themes.dart';

class AddressController extends GetxController implements AddressSelectable {
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
  final isPrimary = false.obs;

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

  RxList<AddressModel> addresses = <AddressModel>[].obs;

  RxString editingAddressId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAddresses();
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
  Future<List<dynamic>> search(AddressLevel level, String q) async {
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

  Future<void> fetchAddresses() async {
    print("🔄 Fetching addresses...");
    isLoading.value = true;

    try {
      final token = await TokenManager.getToken();
      print("🔍 [DEBUG] token dari TokenManager: $token");

      if (token == null || token.isEmpty) {
        Get.snackbar("Gagal", "User belum login.");
        return;
      }

      final res = await TerritoryService.getAllAddress();

      res.fold(
        (l) {
          print("❌ Gagal load semua data alamat: ${l.message}");
          Get.snackbar("Error", l.message ?? "Gagal mengambil alamat.");
        },
        (r) {
          final list = r.data ?? [];

          // simpan langsung ke observable list
          addresses.assignAll(list);

          print("✅ Loaded ${addresses.length} alamat");
        },
      );
    } catch (e) {
      print("❌ Exception saat fetchAddresses: $e");
      Get.snackbar("Error", "Terjadi kesalahan tak terduga.");
    } finally {
      isLoading.value = false;
    }
  }

  void openAddAddressPopup(BuildContext context) {
    Get.dialog(
      PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            // Bisa digunakan kalau ingin refresh sesuatu setelah popup ditutup
          }
        },
        child: AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
          title: Center(
            child: Text(
              "Tambah Alamat Baru",
              style: styletext(
                fontsize: 19,
                fontWeight: semibold,
                color: textInputColor,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // PROVINCE
              InputWithLabel(
                label: "Provinsi",
                input: CustomAddressInput(
                  level: AddressLevel.province,
                  hintText: "Pilih Provinsi",
                  handler: this,
                  hintStyle: styletext(
                    fontsize: 10,
                    fontWeight: medium,
                    color: textInputColor,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // REGENCY
              InputWithLabel(
                label: "Kabupaten/Kota",
                input: CustomAddressInput(
                  level: AddressLevel.regency,
                  hintText: "Pilih Kabupaten/Kota",
                  handler: this,
                  hintStyle: styletext(
                    fontsize: 10,
                    fontWeight: medium,
                    color: textInputColor,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // DISTRICT
              InputWithLabel(
                label: "Kecamatan",
                input: CustomAddressInput(
                  level: AddressLevel.district,
                  hintText: "Pilih Kecamatan",
                  handler: this,
                  hintStyle: styletext(
                    fontsize: 10,
                    fontWeight: medium,
                    color: textInputColor,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // VILLAGE
              InputWithLabel(
                label: "Desa/Kelurahan",
                input: CustomAddressInput(
                  level: AddressLevel.village,
                  hintText: "Pilih Desa/Kelurahan",
                  handler: this,
                  hintStyle: styletext(
                    fontsize: 10,
                    fontWeight: medium,
                    color: textInputColor,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // DETAIL ADDRESS
              InputWithLabel(
                label: "Detail Alamat",
                input: CustomInput(
                  hintText: "",
                  controller: addressDetailController,
                  hintStyle: styletext(
                    fontsize: 10,
                    fontWeight: medium,
                    color: textInputColor,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            customElevatedButton(
              text: "Simpan",
              onTap: () {
                addAddress();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
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

  Future<void> updateAddress(String addressId) async {
    isLoading.value = true;

    // ==== DEBUG LOG SEBELUM REQUEST ====
    print("======= DEBUG UPDATE ADDRESS =======");
    print("Address ID          : $addressId");
    print("Village ID (baru)   : ${selectedVillageId.value}");
    print("Detail Alamat (baru): ${addressDetailController.text.trim()}");
    print("Set Primary?        : ${isPrimary.value}");
    print("====================================");

    try {
      final req = PutAddressRequest(
        addressId: addressId,
        villageId: selectedVillageId.value,
        addressDetail: addressDetailController.text.trim(),
        isPrimary: isPrimary.value,
      );

      final res = await TerritoryService.updateAddress(addressId, req);

      res.fold(
        (l) {
          print("❌ UPDATE GAGAL: ${l.message}");
          Get.snackbar("Error", l.message ?? "Gagal update alamat");
        },
        (r) {
          print("✅ UPDATE BERHASIL");
          print("=== DATA YANG DITERIMA DARI SERVER ===");
          print(r.data);
          print("=======================================");

          Get.snackbar("Berhasil", "Alamat berhasil diperbarui");

          // Debug tambahan untuk memastikan commit perubahan
          Future.delayed(Duration(milliseconds: 300), () async {
            print("🔄 Re-fetching addresses untuk verifikasi...");
            // await fetchAddresses();
            print("📦 Address list setelah update:");
            for (var a in addresses) {
              print(
                  "- ${a.id} | ${a.addressDetail} | Desa: ${a.village?.name}");
            }
            print("=======================================");
          });
        },
      );
    } catch (e) {
      print("🔥 EXCEPTION terjadi saat update: $e");
      Get.snackbar("Error", "Terjadi masalah tak terduga");
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> updateAddress(String addressId) async {
  //   isLoading.value = true;

  //   try {
  //     final req = PutAddressRequest(
  //       addressId: addressId,
  //       villageId: editingAddressId.value,
  //       addressDetail: addressDetailController.text.trim(),
  //       isPrimary: isPrimary.value,
  //     );

  //     final res = await TerritoryService.updateAddress(addressId, req);

  //     res.fold(
  //       (l) => Get.snackbar("Error", l.message ?? "Gagal update alamat"),
  //       (r) {
  //         Get.snackbar("Berhasil", "Alamat berhasil diperbarui");
  //         // fetchAddresses();
  //       },
  //     );
  //   } catch (e) {
  //     Get.snackbar("Error", "Terjadi masalah tak terduga");
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  @override
  void onClose() {
    addressDetailController.dispose();
    super.onClose();
  }
}
