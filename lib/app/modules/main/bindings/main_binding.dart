import 'package:get/get.dart';
import 'package:jepretin/app/modules/home/controllers/home_controller.dart';
import '../controllers/main_controller.dart';

// 🔥 IMPORT CONTROLLER HALAMAN ANAK DI SINI


class MainBinding extends Bindings {
  @override
  void dependencies() {
    // Controller Utama
    Get.lazyPut<MainController>(() => MainController());

    // Controller Anak (Wajib didaftarkan agar tidak error "Controller not found")
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HomeController>(() => HomeController());

  }
}