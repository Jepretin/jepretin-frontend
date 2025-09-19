import 'package:get/get.dart';

import '../controllers/confirm_pembayaran_controller.dart';

class ConfirmPembayaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmPembayaranController>(
      () => ConfirmPembayaranController(),
    );
  }
}
