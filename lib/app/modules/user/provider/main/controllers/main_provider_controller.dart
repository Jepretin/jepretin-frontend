import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
// import 'package:jepretin/app/modules/menu-navbar/help/views/help_view.dart';
// import 'package:jepretin/app/modules/menu-navbar/promotion/views/promotion_view.dart';
// import 'package:jepretin/app/modules/menu-navbar/transaction/history_transaction/views/history_transaction_view.dart';
import 'package:jepretin/app/modules/user/provider/dashboard_provider/views/dashboard_provider_view.dart';
import 'package:jepretin/app/modules/user/provider/jasa/views/jasa_view.dart';
import 'package:jepretin/app/modules/user/provider/pesanan/views/pesanan_view.dart';
import 'package:jepretin/app/modules/user/provider/profile-provider/views/profile_provider_view.dart';

class MainProviderController extends GetxController {
  int selectedNavbar = 0;
  // bool isNavbarVisible = true;

  List<Widget> page = [
    DashboardProviderView(),
    PesananView(),
    JasaView(),
    ProfileProviderView()
  ];

  void onChangeIndex(int index) {
    selectedNavbar = index;

    // if (index == 2) {
    //   isNavbarVisible = false;
    // } else {
    //   isNavbarVisible = true;
    // }

    print("index: ${selectedNavbar}");
    update();
  }

  void goTo(String route) {
    Get.toNamed(route);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
