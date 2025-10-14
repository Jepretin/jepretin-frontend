import 'package:get/get.dart';

import '../controllers/main_provider_controller.dart';

class MainProviderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainProviderController>(
      () => MainProviderController(),
    );
  }
}
