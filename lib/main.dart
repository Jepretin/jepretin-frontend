import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jepretin/app/core/themes/app_theme.dart';
import 'package:jepretin/app/core/themes/theme_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  // 1. Wajib dipanggil jika main() menggunakan async
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Inisialisasi local storage
  await GetStorage.init();

  // 3. Daftarkan ThemeController ke dalam memori secara global
  final themeController = Get.put(ThemeController());

  // 2. Buka "buku catatan"
  const storage = FlutterSecureStorage();

  // 3. Baca apakah kunci 'hasSeenOnboarding' sudah bernilai 'true'
  String? hasSeenOnboarding = await storage.read(key: 'hasSeenOnboarding');

  // 4. Logika penentuan rute
  String firstRoute =
      (hasSeenOnboarding == 'true') ? Routes.MAIN : Routes.ONBOARDING;

  runApp(
    GetMaterialApp(
      title: "Jepretin",
      // 🔥 Gunakan rute dinamis hasil pengecekan di atas
      initialRoute: firstRoute,
      getPages: AppPages.routes,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeController.themeMode.value,
      debugShowCheckedModeBanner: false,
    ),
  );
  // runApp(
  //   GetMaterialApp(
  //     title: "Jepretin",
  //     // initialRoute: AppPages.INITIAL,
  //     initialRoute: Routes.ONBOARDING,
  //     getPages: AppPages.routes,
  //     theme: AppTheme.light,
  //     darkTheme: AppTheme.dark,

  //     // UBAH BARIS INI: Ambil value dari ThemeMode
  //     themeMode: themeController.themeMode.value,

  //     debugShowCheckedModeBanner: false,
  //   ),
  // );
}
