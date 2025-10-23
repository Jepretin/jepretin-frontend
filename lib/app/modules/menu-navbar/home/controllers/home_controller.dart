import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jepretin/app/data/core/helper/token_manager.dart';
import 'package:jepretin/app/modules/user/customer/profile/views/profile_view.dart';
import 'package:jepretin/app/shared/customCardContent.dart';
import 'package:jepretin/app/data/services/imagekit_endpoint.dart';
import 'package:jepretin/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final isFavorite = false.obs;
  final isNama = ''.obs;
  final isLocation = false.obs;
  final isLoggedIn = false.obs;

  // final selectedProvince = ''.obs;
  // final selectedCity = ''.obs;
  RxString selectedCity = ''.obs;
  // final selectedDistrict = ''.obs;
  // final selectedVillage = ''.obs;

  final addressController = TextEditingController();

  // final providerList = <Map<String, dynamic>>[].obs;

  final List<Map<String, dynamic>> allProviders = [
    {
      "city": "Jakarta",
      "providers": [
        {
          "profileImage": ImagekitEndpoint.images("monyet.jpg"),
          "title": "Tim Jepretin",
          "subtitle": "Photographer",
          "mainImage": ImagekitEndpoint.feed("mount.png"),
          "likes": 18,
          "ratio": CardImageRatio.landscape,
        },
        {
          "profileImage": ImagekitEndpoint.images("monyet.jpg"),
          "title": "Diamond Pictora",
          "subtitle": "Photographer & Videographer",
          "mainImage": ImagekitEndpoint.feed("wedding.png"),
          "likes": 27,
          "ratio": CardImageRatio.portrait,
        },
      ]
    },
    {
      "city": "Surabaya",
      "providers": [
        {
          "profileImage": ImagekitEndpoint.images("monyet.jpg"),
          "title": "Sky Lens",
          "subtitle": "Drone Specialist",
          "mainImage": ImagekitEndpoint.feed("buthak.jpg"),
          "likes": 45,
          "ratio": CardImageRatio.landscape,
        },
        {
          "profileImage": ImagekitEndpoint.images("monyet.jpg"),
          "title": "Sky Lens",
          "subtitle": "Drone Specialist",
          "mainImage": ImagekitEndpoint.feed("buthak.jpg"),
          "likes": 45,
          "ratio": CardImageRatio.landscape,
        },
        {
          "profileImage": ImagekitEndpoint.images("monyet.jpg"),
          "title": "Sky Lens",
          "subtitle": "Drone Specialist",
          "mainImage": ImagekitEndpoint.feed("buthak.jpg"),
          "likes": 45,
          "ratio": CardImageRatio.landscape,
        },
      ]
    }
  ];

  RxList<Map<String, dynamic>> providerList = <Map<String, dynamic>>[].obs;

  bool isStar = false;
  int index = 0;

  List aboutJepretin = [
    {'image': Icons.privacy_tip_outlined, 'title': 'Kebijakan', 'ontap': () {}},
    {
      'image': Icons.policy_outlined,
      'title': 'Syarat & Ketentuan',
      'ontap': () {}
    },
    {'image': Icons.error_outline, 'title': 'Laporkan', 'ontap': () {}},
  ];

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
    checkToken();
    loadInitialProviders();
  }

  /// Cek token dari penyimpanan lokal
  void checkToken() async {
    final token = await TokenManager.getToken();
    print("🔥 TOKEN SEKARANG: $token");
  }

  /// Cek apakah user sudah login
  void checkLoginStatus() async {
    final loggedIn = await TokenManager.isLoggedIn();
    isLoggedIn.value = loggedIn;
    print("🔐 Status login: $loggedIn");
  }

  /// Ketika user memilih lokasi
  Future<void> selectLocation({
    // required String province,
    required String city,
    // required String district,
    // required String village,
  }) async {
    // Simpan lokasi yang dipilih
    // selectedProvince.value = province;
    selectedCity.value = city;
    // selectedDistrict.value = district;
    // selectedVillage.value = village;

    // print("📍 Lokasi dipilih: $province, $city, $district, $village — ambil data provider...");
    print("📍 Lokasi dipilih: $city — ambil data provider...");

    // Ambil data provider sesuai jangkauan
    await fetchProviderByLocation();

    // Tampilkan main view setelah lokasi dipilih
    isLocation.value = true;
  }

  /// Reset lokasi (kembali ke tampilan awal)
  void clearLocation() {
    // Kosongkan semua data lokasi
    // selectedProvince.value = '';
    selectedCity.value = '';
    // selectedDistrict.value = '';
    // selectedVillage.value = '';

    // Kosongkan provider list
    providerList.clear();

    // Kembalikan ke tampilan awal (belum pilih lokasi)
    isLocation.value = false;
  }

  /// Dummy: load awal (pakai kota pertama di allProviders)
  void loadInitialProviders() {
    if (allProviders.isNotEmpty) {
      final firstCityProviders = allProviders.first["providers"] as List;
      providerList
          .assignAll(List<Map<String, dynamic>>.from(firstCityProviders));
    } else {
      providerList.clear();
    }
  }

  /// Ambil provider dari API berdasarkan lokasi (versi siap backend)
  Future<void> fetchProviderByLocation() async {
    try {
      // TODO: Ganti nanti dengan API call nyata
      // final result = await ProviderService.getByLocation(
      //   province: selectedProvince.value,
      //   city: selectedCity.value,
      //   district: selectedDistrict.value,
      //   village: selectedVillage.value,
      // );
      // providerList.assignAll(result);

      /// Sementara: Filter dummy berdasarkan nama kota
      final city = selectedCity.value.trim();
      print("🔍 Mencari provider berdasarkan kota: $city");

// Cari kota di allProviders
      final cityData = allProviders.firstWhereOrNull(
        (item) => item["city"].toString().toLowerCase() == city.toLowerCase(),
      );

      if (cityData != null) {
        final providers =
            List<Map<String, dynamic>>.from(cityData["providers"]);
        providerList.assignAll(providers);
        print("✅ ${providers.length} provider ditemukan untuk $city");
      } else {
        providerList.clear();
        print("⚠️ Tidak ada provider ditemukan untuk $city");
      }
    } catch (e) {
      print("❌ Gagal memuat provider berdasarkan lokasi: $e");
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
}
