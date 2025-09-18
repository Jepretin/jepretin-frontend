import 'package:get/get.dart';

import '../controllers/profile_email_controller.dart';

class ProfileEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileEmailController>(
      () => ProfileEmailController(),
    );
  }
}
