import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jepretin/app/data/core/helper/token_manager.dart';
import 'package:jepretin/app/modules/user/customer/profile/views/profile_view.dart';
import 'package:jepretin/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final isFavorite = false.obs;
  final isNama = ''.obs;
  final isLocation = false.obs;
  // final selectedLocation = "".obs;
  final isLoggedIn = false.obs;

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

  List locations = [
    "Kota Kediri",
    "Ngajuk",
    "Ngasem",
    "Pare",
  ];

  void selectLocation() {
    isLocation.value = true;
  }

  void clearLocation() {
    isLocation.value = false;
  }

  // @override
  // void setLocation(String loc) {
  //   selectedLocation.value = loc;
  //   isLocation.value = true;
  // }

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
    checkToken();
  }

  void checkToken() async {
    final token = await TokenManager.getToken();
    print("🔥 TOKEN SEKARANG: $token");
  }

  void checkLoginStatus() async {
    final loggedIn = await TokenManager.isLoggedIn();
    isLoggedIn.value = loggedIn;
    print("🔐 Status login: $loggedIn");
  }

  void goToProfile() {
    if (isLoggedIn.value) {
      Get.toNamed('/profile');
    } else {
      Get.snackbar("Akses Ditolak", "Silakan login terlebih dahulu");
    }
  }

  // Route
  void goToCart() {
    Get.toNamed('/cart');
    print("Pindah ke halaman Cart");
  }

  // void goToProfile() {
  //   Get.toNamed('/profile');
  //   print("Pindah ke halaman profile");
  // }

  void goToNotif() {
    Get.toNamed('/mainp');
    print("Pindah ke halaman notifikasi");
  }
  // @override
  // void goToCart() {
  //   Get.to(() => const CartView());
  // }
}
