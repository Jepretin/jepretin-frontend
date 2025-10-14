import 'package:get/get.dart';

import '../controllers/dashboard_provider_controller.dart';

class DashboardProviderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardProviderController>(
      () => DashboardProviderController(),
    );
  }
}
