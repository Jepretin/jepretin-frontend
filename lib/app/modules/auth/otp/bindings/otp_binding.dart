import 'package:get/get.dart';
import '../controllers/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    // lazyPut agar hanya dibuat saat route dibuka
    Get.lazyPut<OtpController>(() => OtpController());
  }
}