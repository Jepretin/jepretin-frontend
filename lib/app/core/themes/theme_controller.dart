import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _storage = GetStorage();
  final _storageKey = 'themeMode';

  // Sekarang kita gunakan Rx<ThemeMode> untuk menampung 3 status
  Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromStorage();
  }

  // Fungsi untuk membaca data dari local storage saat aplikasi dibuka
  void _loadThemeFromStorage() {
    String? savedTheme = _storage.read(_storageKey);
    
    if (savedTheme == 'light') {
      themeMode.value = ThemeMode.light;
    } else if (savedTheme == 'dark') {
      themeMode.value = ThemeMode.dark;
    } else {
      // Jika kosong atau diset 'system', ikuti bawaan HP
      themeMode.value = ThemeMode.system;
    }
  }

  // Fungsi baru untuk mengubah tema spesifik
  void setTheme(ThemeMode mode) {
    themeMode.value = mode;
    Get.changeThemeMode(mode);
    
    // Simpan ke storage sebagai string agar mudah dibaca
    if (mode == ThemeMode.light) {
      _storage.write(_storageKey, 'light');
    } else if (mode == ThemeMode.dark) {
      _storage.write(_storageKey, 'dark');
    } else {
      _storage.write(_storageKey, 'system');
    }
  }

  // Helper cerdas untuk mengecek apakah aplikasi sedang dalam mode gelap
  // (Sangat berguna untuk mengatur icon atau warna spesifik di UI)
  bool get isDarkModeActive {
    if (themeMode.value == ThemeMode.system) {
      // Baca langsung dari sistem HP jika settingannya System
      return WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark;
    }
    return themeMode.value == ThemeMode.dark;
  }
}