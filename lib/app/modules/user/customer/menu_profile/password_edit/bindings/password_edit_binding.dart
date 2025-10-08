import 'package:get/get.dart';

import '../controllers/password_edit_controller.dart';

class PasswordEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordEditController>(
      () => PasswordEditController(),
    );
  }
}
