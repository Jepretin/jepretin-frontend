import 'package:get/get.dart';

import '../controllers/profile_term_controller.dart';

class ProfileTermBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileTermController>(
      () => ProfileTermController(),
    );
  }
}
