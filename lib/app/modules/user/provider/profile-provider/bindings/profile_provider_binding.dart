import 'package:get/get.dart';

import '../controllers/profile_provider_controller.dart';

class ProfileProviderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileProviderController>(
      () => ProfileProviderController(),
    );
  }
}
