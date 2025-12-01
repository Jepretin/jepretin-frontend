import 'package:get/get.dart';

import '../controllers/manage_orders_controller.dart';

class ManageOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageOrdersController>(
      () => ManageOrdersController(),
    );
  }
}
