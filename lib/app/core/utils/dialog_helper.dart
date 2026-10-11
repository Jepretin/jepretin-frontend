// lib/app/core/utils/dialog_helper.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jepretin/app/core/themes/app_colors.dart';
import 'package:jepretin/app/routes/app_pages.dart';

import '../utils/font_styles.dart';
import '../../widgets/custom_button.dart';
import '../helper/token_manager.dart';

class DialogHelper {
  // --- 1. SNACKBAR ERROR (Global) ---
  static void showError(String message) {
    Get.snackbar(
      'Gagal',
      message,
      backgroundColor: AppColors.error,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      icon: const Icon(Icons.error_outline, color: Colors.white),
      duration: const Duration(seconds: 3),
    );
  }

  // --- 2. SNACKBAR SUKSES (Global) ---
  static void showSuccess(String message) {
    Get.snackbar(
      'Berhasil',
      message,
      backgroundColor: AppColors.success, // Pastikan ada warna success di AppColors
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      icon: const Icon(Icons.check_circle_outline, color: Colors.white),
      duration: const Duration(seconds: 3),
    );
  }

  // --- 3. BOTTOM SHEET SESI HABIS (Global) ---
  static void showSessionExpired() {
    // Cek dulu apakah bottom sheet sudah terbuka biar nggak numpuk
    if (Get.isBottomSheetOpen == true) return; 

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.lock_clock, size: 60, color: AppColors.warning),
            const SizedBox(height: 16),
            Text('Sesi Habis', style: styletext(fontsize: 20, fontWeight: bold)),
            const SizedBox(height: 8),
            Text(
              'Sesi login kamu sudah berakhir. Silakan login kembali untuk melanjutkan.', 
              style: styletext(fontsize: 14, fontWeight: regular),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Login Ulang',
              onPressed: () async {
                await TokenManager.clearToken(); // Hapus token dari brankas
                Get.offAllNamed(Routes.LOGIN); // Lempar ke halaman login
              },
            ),
          ],
        ),
      ),
      isDismissible: false,
      enableDrag: false,
    );
  }
}