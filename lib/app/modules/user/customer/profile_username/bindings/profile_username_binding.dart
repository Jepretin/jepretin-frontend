import 'package:get/get.dart';

import '../controllers/profile_username_controller.dart';

class ProfileUsernameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileUsernameController>(
      () => ProfileUsernameController(),
    );
  }
}
