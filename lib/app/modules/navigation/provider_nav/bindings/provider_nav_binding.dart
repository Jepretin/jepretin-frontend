import 'package:get/get.dart';

import '../controllers/provider_nav_controller.dart';

class ProviderNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProviderNavController>(
      () => ProviderNavController(),
    );
  }
}
