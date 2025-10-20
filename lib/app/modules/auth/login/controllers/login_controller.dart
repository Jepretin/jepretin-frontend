import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jepretin/app/data/core/helper/token_manager.dart';
import 'package:jepretin/app/data/models/auth_model.dart';
import 'package:jepretin/app/data/request/auth_service.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;

    final request = LoginRequest(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    final res = await AuthService.loginUser(request);

    res.fold(
      (l) {
        Get.snackbar("Login Gagal", l.message ?? "Terjadi kesalahan");
      },
      (r) async {
        print("👉 Response di LoginController: ${r.toString()}");
        // Simpan token untuk auth berikutnya
        // final token = r.data?.data?.token ?? "";
        // final userEmail = r.data?.data?.user?.email ?? "-";
        final token = r.data?.token ?? "";
        final userEmail = r.data?.user?.email ?? "-";

        // print("📦 LoginResponse JSON: ${r.data?.toJson()}");

        if (token.isNotEmpty) {
          Get.snackbar("Sukses", "Login berhasil untuk $userEmail");
          final role = r.data?.user?.role ?? "user";
          final userId = r.data?.user?.id ?? "";

          // Simpan ke secure storage
          await TokenManager.saveToken(token);
          // await TokenManager.saveRole(role);
          // await TokenManager.saveUserId(userId);
          // Navigasi berdasarkan role
          if (role == "provider") {
            Get.offAllNamed("/dashboard-provider");
          } else {
            Get.offAllNamed("/main");
          }

          print("🔑 Token tersimpan: $token");
          print("🧩 Role: $role | User ID: $userId");
        } else {
          Get.snackbar("Login Gagal", "Token kosong, cek API response");
        }
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
