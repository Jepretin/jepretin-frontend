import 'package:flutter/material.dart';
import 'package:jepretin/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {

  void goTo(String route) {
    Get.toNamed(route);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
