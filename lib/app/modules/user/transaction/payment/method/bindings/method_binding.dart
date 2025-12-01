import 'package:get/get.dart';

import '../controllers/method_controller.dart';

class MethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MethodController>(
      () => MethodController(),
    );
  }
}
