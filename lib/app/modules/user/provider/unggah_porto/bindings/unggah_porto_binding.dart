import 'package:get/get.dart';

import '../controllers/unggah_porto_controller.dart';

class UnggahPortoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UnggahPortoController>(
      () => UnggahPortoController(),
    );
  }
}
