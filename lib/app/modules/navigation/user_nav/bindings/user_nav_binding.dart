import 'package:get/get.dart';

import '../controllers/user_nav_controller.dart';

class UserNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserNavController>(() => UserNavController());
  }
}
