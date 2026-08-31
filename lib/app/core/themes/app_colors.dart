// lib/app/core/theme/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // --- 1. CORE PRIMARY ---
  // Ambil dari kotak "Primary" yang paling atas
  static const Color primary = Color(0xFF03314B); // Ganti dengan Hex aslinya

  // --- 2. PRIMARY SCALE (Kiri ke Kanan) ---
  static const Color primary900 = Color(0xFF03314B); // Paling gelap (Kiri)
  static const Color primary800 = Color(0xFF125174);
  static const Color primary700 = Color(0xFF2B749D);
  static const Color primary600 = Color(0xFF4E9AC5);
  static const Color primary500 = Color(0xFF7BC4EE); // Tengah
  static const Color primary400 = Color(0xFF99DAFF);
  static const Color primary300 = Color(0xFFB0E2FF);
  static const Color primary200 = Color(0xFFC6EAFF);
  static const Color primary100 = Color(0xFFDCF2FF);
  static const Color primary50  = Color(0xFFF2FAFF); // Paling terang (Kanan)

  // --- 3. NEUTRAL SCALE (Kiri ke Kanan) ---
  // Sangat krusial untuk teks, background, dan border
  static const Color neutral50  = Color(0xFFFFFFFF); // Kiri (Putih)
  static const Color neutral100 = Color(0xFFF5F5F5); 
  static const Color neutral200 = Color(0xFFE5E5E5);
  static const Color neutral300 = Color(0xFFD4D4D4);
  static const Color neutral400 = Color(0xFFA3A3A3);
  static const Color neutral500 = Color(0xFF737373); // Tengah
  static const Color neutral600 = Color(0xFF525252);
  static const Color neutral700 = Color(0xFF404040);
  static const Color neutral800 = Color(0xFF262626);
  static const Color neutral900 = Color(0xFF171717); // Kanan (Hitam/Gelap)

  // --- 4. SEMANTIC COLORS ---
  static const Color success = Color(0xFF10B981); // Hijau
  static const Color warning = Color(0xFFF59E0B); // Oranye/Kuning
  static const Color error   = Color(0xFFEF4444); // Merah
  static const Color info    = Color(0xFF3B82F6); // Biru
  static const Color accent  = Color(0xFF06B6D4); // Cyan/Biru Muda

  // =========================================================
  // --- MAPPING UNTUK WIDGET (OTOMATISASI LIGHT/DARK MODE) ---
  // =========================================================
  
  // Background Aplikasi
  static const Color bgLight = neutral50;
  static const Color bgDark  = neutral900; 

  // Background Text Field
  static const Color inputBgLight = neutral100;
  static const Color inputBgDark  = neutral800;

  // Warna Teks Utama
  static const Color textLight = neutral900; // Teks gelap di mode terang
  static const Color textDark  = neutral50;  // Teks terang di mode gelap
}