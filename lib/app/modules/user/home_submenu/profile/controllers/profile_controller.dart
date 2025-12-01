// import 'package:flutter/material.dart';
// import 'package:jepretin/app/routes/app_pages.dart';
import 'package:jepretin/app/data/core/helper/token_manager.dart';
import 'package:jepretin/app/data/models/user_model.dart';
import 'package:jepretin/app/data/request/user_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final user = Rxn<UserProfileModel>();
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    checkToken();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    isLoading.value = true;

    final loggedIn = await TokenManager.isLoggedIn();
    if (!loggedIn) {
      isLoading.value = false;
      print("🚫 User belum login, profile tidak di-load");
      return;
    }

    // ✅ Load dari TokenManager (cached user)
    final cachedUser = await TokenManager.getUser();
    if (cachedUser != null) {
      user.value = UserProfileModel(
        id: cachedUser.id,
        email: cachedUser.email,
        name: cachedUser.email?.split('@').first ?? 'Guest',
        role: cachedUser.role,
      );
    }

    // ✅ Fetch dari API (update terbaru)
    final res = await UserService.getProfile();
    res.fold(
      (l) {
        print("❌ Gagal load profile: ${l.message}");
      },
      (r) async {
        print("✅ Berhasil load profile: ${r.data}");
        user.value = r.data;
        // Simpan ke TokenManager lagi (refresh data)
        await TokenManager.saveUser(UserModel(
          id: r.data?.id,
          email: r.data?.email,
          role: r.data?.role,
        ));
      },
    );

    isLoading.value = false;
  }

  void checkToken() async {
    final token = await TokenManager.getToken();
    print("🔥 TOKEN SEKARANG: $token");
  }

  void goTo(String route) {
    Get.toNamed(route);
  }

  Future<void> logout() async {
    await TokenManager.clearToken();
    Get.offAllNamed("/main");
    Get.snackbar("Logout", "Anda telah keluar.");
  }
}
