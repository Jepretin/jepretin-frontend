import 'package:get/get.dart';

import '../controllers/profile_policy_controller.dart';

class ProfilePolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePolicyController>(
      () => ProfilePolicyController(),
    );
  }
}
