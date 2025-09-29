// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jepretin/app/data/models/auth_model.dart';
import 'package:jepretin/app/data/request/auth_service.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  final isLoading = false.obs;

  Future<void> register() async {
    isLoading.value = true;

    final request = RegisterRequest(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
    );

    final res = await AuthService.registerUser(request);

    res.fold(
      (error) {
        Get.snackbar("Register Gagal", error.message ?? "Terjadi kesalahan");
      },
      (response) {
        Get.snackbar(
            "Sukses", "OTP sudah dikirim ke email ${response.data?.email}");
        // Simpan email untuk nanti verify OTP
        Get.toNamed('/otp', arguments: response.data?.email);
      },
    );

    isLoading.value = false;
  }

  @override
  void onClose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
