// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jepretin/app/data/models/auth_model.dart';
import 'package:jepretin/app/data/services/auth_service.dart';

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
      password: passwordController.text,
      phone: phoneController.text,
    );

    final res = await AuthService.registerUser(request);

    res.fold(
      // (l) {
      //   if (l.statusCode == 400 && l.statusCode != null) {
      //     Get.snackbar("Validasi Gagal", l.message!.splitMapJoin("\n"),);
      //   } else if (l.statusCode == 409) {
      //     Get.snackbar(
      //         "Register Gagal", "Email sudah terdaftar, silakan login.");
      //   } else {
      //     print("❌ ERROR: ${l.statusCode} - ${l.message}");
      //     Get.snackbar("Register Gagal", l.message ?? "Terjadi kesalahan");
      //   }
      // },
      (l) {
        if (l.statusCode == 400) {
          Get.snackbar(
            "Validasi Gagal",
             "Email wajib diisi, Password minimal 6 karakter",
          );
        } else if (l.statusCode == 409) {
          Get.snackbar(
            "Register Gagal",
            "Email sudah terdaftar",
          );
        } else {
          Get.snackbar(
            "Error",
            l.message ?? "Terjadi kesalahan",
          );
        }
      },
      (r) {
        final userEmail = r.data?.user?.email ?? "";
        print("📩 Email dari register: $userEmail");

        print("✅ SUKSES: ${r.data?.user?.email}");
        Get.snackbar("Sukses", "OTP sudah dikirim ke ${r.data?.user?.email}");
        Get.toNamed('/otp', arguments: userEmail);
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
