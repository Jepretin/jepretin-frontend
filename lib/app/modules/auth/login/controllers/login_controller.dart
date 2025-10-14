import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jepretin/app/data/models/auth_model.dart';
import 'package:jepretin/app/data/request/auth_service.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final box = GetStorage();

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
      (r) {
        print("👉 Response di LoginController: ${r.toString()}");
        // Simpan token untuk auth berikutnya
        // final token = r.data?.data?.token ?? "";
        // final userEmail = r.data?.data?.user?.email ?? "-";
        final token = r.data?.token ?? "";
        final userEmail = r.data?.user?.email ?? "-";

        print("📦 LoginResponse JSON: ${r.data?.toJson()}");

        if (token.isNotEmpty) {
          Get.snackbar("Sukses", "Login berhasil untuk $userEmail");

          box.write("token", token); 
          box.write("user", r.data?.user?.toJson());
          print("🔑 Token tersimpan: $token");
          Get.offAllNamed("/main");
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
