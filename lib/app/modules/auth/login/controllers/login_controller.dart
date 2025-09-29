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
      (error) {
        Get.snackbar("Login Gagal", error.message ?? "Terjadi kesalahan");
      },
      (response) {
        Get.snackbar(
            "Sukses", "OTP sudah dikirim ke email ${response.data?.email}");
        // Simpan email untuk nanti verify OTP
        // Get.toNamed('/otp', arguments: response.data?.email);
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
