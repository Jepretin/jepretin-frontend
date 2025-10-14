import 'package:get/get.dart';

import '../controllers/jasa_controller.dart';

class JasaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JasaController>(
      () => JasaController(),
    );
  }
}
