// lib/app/modules/main/controllers/main_controller.dart
import 'package:get/get.dart';

class MainController extends GetxController {
  // Index aktif saat ini (0 = Home)
  final RxInt selectedIndex = 0.obs;

  // Fungsi pindah tab
  void changePage(int index) {
    selectedIndex.value = index;
  }
}