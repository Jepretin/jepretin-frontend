import 'package:get/get.dart';

import '../controllers/upload_portfolio_controller.dart';

class UploadPortfolioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadPortfolioController>(
      () => UploadPortfolioController(),
    );
  }
}
