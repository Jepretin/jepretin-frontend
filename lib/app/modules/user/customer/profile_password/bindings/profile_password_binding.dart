import 'package:get/get.dart';

import '../controllers/profile_password_controller.dart';

class ProfilePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePasswordController>(
      () => ProfilePasswordController(),
    );
  }
}
