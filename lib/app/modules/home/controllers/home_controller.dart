import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final isFavorite = false.obs;
  final isNama = ''.obs;
  final isLocation = false.obs;
  final selectedLocation = "".obs;

  bool isStar = false;
  int index = 0;

  List aboutJepretin = [
    {'image': Icons.privacy_tip_outlined, 'title': 'Kebijakan', 'ontap': () {}},
    {'image': Icons.policy_outlined, 'title': 'Syarat & Ketentuan', 'ontap': () {}},
    {'image': Icons.error_outline, 'title': 'Laporkan', 'ontap': () {}},
  ];

  List locations = [
    "Kota Kediri",
    "Ngajuk",
    "Ngasem",
    "Pare",
  ];

  @override
  void setLocation(String loc){
    selectedLocation.value = loc;
    isLocation.value = true;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
