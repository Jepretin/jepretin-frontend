import 'package:get/get.dart';

import '../controllers/regis_provider_controller.dart';

class RegisProviderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisProviderController>(
      () => RegisProviderController(),
    );
  }
}
