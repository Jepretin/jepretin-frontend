// lib/app/widgets/custom_button.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jepretin/app/core/themes/app_colors.dart';

import '../core/utils/app_radius.dart';
import '../core/utils/font_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // Dibuat nullable agar mendukung fitur 'disabled' (tombol mati)
  final IconData? icon;
  final bool isOutline;
  final double width;
  final double height;
  final Color? customBgColor; // Jika butuh warna khusus (misal: tombol Delete merah)
  final Color? customTextColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isOutline = false,
    this.width = double.infinity,
    this.height = 52.0, // Tinggi standar tombol untuk sentuhan (touch target)
    this.customBgColor,
    this.customTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1. Deteksi tema aktif
    final isDark = context.isDarkMode;

    // 2. Logika Warna Otomatis
    // Jika tombol outline di Dark Mode, garis dan teksnya jadi putih (neutral50) agar tidak tenggelam. 
    // Di Light Mode tetap pakai warna Primary.
    final dynamicPrimary = isDark ? AppColors.neutral50 : AppColors.primary;
    
    final defaultBgColor = isOutline ? Colors.transparent : AppColors.primary;
    final defaultTextColor = isOutline ? dynamicPrimary : AppColors.neutral50;
    final defaultBorderColor = dynamicPrimary;

    // Terapkan warna custom jika ada, kalau tidak pakai default
    final resolvedBgColor = customBgColor ?? defaultBgColor;
    final resolvedTextColor = customTextColor ?? defaultTextColor;
    final resolvedBorderColor = customBgColor ?? defaultBorderColor;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: resolvedBgColor,
          foregroundColor: resolvedTextColor,
          elevation: isOutline ? 0 : 2, // Hilangkan bayangan jika tombol outline
          
          // --- MENGGUNAKAN GLOBAL RADIUS (LG = 16px) ---
          shape: RoundedRectangleBorder(
            borderRadius: borderRadiusLG, 
          ),
          
          // Logika Garis Pinggir
          side: isOutline 
              ? BorderSide(color: resolvedBorderColor, width: 1.5) 
              : BorderSide.none,
              
          // --- LOGIKA TOMBOL MATI (DISABLED) MENGGUNAKAN NEUTRAL SCALE ---
          disabledBackgroundColor: isDark ? AppColors.neutral800 : AppColors.neutral200,
          disabledForegroundColor: isDark ? AppColors.neutral500 : AppColors.neutral400,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20),
              const SizedBox(width: 8), // Jarak antara icon dan teks
            ],
            // --- MENGGUNAKAN FUNGSI STYLETEXT MILIKMU ---
            Text(
              text,
              style: styletext(
                fontsize: 16,
                fontWeight: semibold, // Memanggil weight dari font_styles.dart
                color: resolvedTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}