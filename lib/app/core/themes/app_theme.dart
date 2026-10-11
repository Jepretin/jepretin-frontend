// lib/app/core/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  // ==========================================
  // --- TEMA TERANG (LIGHT MODE) ---
  // ==========================================
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.bgLight, // Mengambil Neutral 50
    fontFamily: 'Poppins', // Sesuaikan jika kamu pakai Montserrat
    
    // ColorScheme memetakan warna Semantic dan Neutral ke komponen bawaan
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.accent, // Warna aksen/pelengkap
      surface: AppColors.bgLight,
      error: AppColors.error,
      onPrimary: Colors.white, // Warna teks di atas tombol primary
      onSurface: AppColors.textLight, // Warna teks di atas background terang
    ),

    // Pengaturan bawaan AppBar untuk Light Mode
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.bgLight,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.textLight),
      titleTextStyle: TextStyle(
        color: AppColors.textLight,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
      ),
    ),

    // Warna icon default saat tidak diset
    iconTheme: const IconThemeData(color: AppColors.neutral600),
  );

  // ==========================================
  // --- TEMA GELAP (DARK MODE) ---
  // ==========================================
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.bgDark, // Mengambil Neutral 900
    fontFamily: 'Poppins',
    
    // ColorScheme untuk Dark Mode
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary, // Bisa diganti ke primary300 jika butuh warna lebih pop-out di dark mode
      secondary: AppColors.accent,
      surface: AppColors.inputBgDark, // Mengambil Neutral 800 untuk elemen melayang (Card/Dialog)
      error: AppColors.error,
      onPrimary: Colors.white,
      onSurface: AppColors.textDark, // Warna teks putih/terang
    ),

    // Pengaturan bawaan AppBar untuk Dark Mode
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.bgDark,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.textDark),
      titleTextStyle: TextStyle(
        color: AppColors.textDark,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
      ),
    ),

    // Warna icon default saat tidak diset (pakai warna terang)
    iconTheme: const IconThemeData(color: AppColors.neutral400),
  );
}