import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jepretin/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final isFavorite = false.obs;
  final isNama = ''.obs;
  final isLocation = false.obs;
  // final selectedLocation = "".obs;

  final box = GetStorage();

  bool isStar = false;
  int index = 0;

  bool isLoggedIn() {
    return box.read("token") != null && box.read("token") != "";
  }
  

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
  }

  // Route
  void goToCart() {
    Get.toNamed('/cart');
    print("Pindah ke halaman Cart");
  }

  void goToProfile() {
    Get.toNamed('/profile');
    print("Pindah ke halaman profile");
  }

  void goToNotif() {
    Get.toNamed('/profile');
    print("Pindah ke halaman notifikasi");
  }
  // @override
  // void goToCart() {
  //   Get.to(() => const CartView());
  // }
}
