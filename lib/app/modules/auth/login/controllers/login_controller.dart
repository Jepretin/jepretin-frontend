import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jepretin/app/data/models/auth_model.dart';
import 'package:jepretin/app/data/request/auth_service.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;

    final request = LoginRequest(
      email: emailController.text,
      password: passwordController.text,
    );

    final res = await AuthService.loginUser(request);

    res.fold(
      (l) {
        Get.snackbar("Login Gagal", l.message ?? "Terjadi kesalahan");
      },
      (r) {
        final userEmail = r.data!.data?.user?.email ?? "-";
        Get.snackbar("Sukses", "Login berhasil untuk $userEmail");

        // Simpan token untuk auth berikutnya
        final token = r.data!.data?.token ?? "";
        print("➡️ Token: $token");

        // Navigasi ke halaman berikutnya
        // Get.toNamed('/home');
      },
    );

    isLoading.value = false;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
