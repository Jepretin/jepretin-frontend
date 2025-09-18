import 'package:get/get.dart';

import '../controllers/profile_report_controller.dart';

class ProfileReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileReportController>(
      () => ProfileReportController(),
    );
  }
}
