import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jepretin/app/data/models/user_model.dart';
import 'package:jepretin/app/data/request/user_service.dart';
import 'package:jepretin/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final box = GetStorage();
  final user = Rxn<UserProfileModel>();
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getUserProfile();
  }

  Future<void> getUserProfile() async {
    final token = box.read("token");
    if (token == null) {
      Get.snackbar("Error", "Anda belum login");
      return;
    }

    final res = await UserService.getProfile();

    res.fold(
      (l) => Get.snackbar("Error", l.message ?? "Gagal ambil user"),
      (r) {
        user.value = r.data; // langsung UserModel
        print("Token user: $token");
        print("👤 User Profile: ${user.value?.toJson()}");
      },
    );
  }

  void goTo(String route) {
    Get.toNamed(route);
  }

  void logout() async {
    await box.remove("token");
    Get.offAllNamed("/main");
    Get.snackbar("Logout", "Anda telah keluar.");
  }
}
