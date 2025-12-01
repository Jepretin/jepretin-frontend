import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
// import 'package:jepretin/app/modules/menu-navbar/help/views/help_view.dart';
// import 'package:jepretin/app/modules/menu-navbar/promotion/views/promotion_view.dart';
// import 'package:jepretin/app/modules/menu-navbar/transaction/history_transaction/views/history_transaction_view.dart';
import 'package:jepretin/app/modules/provider/home/views/home_provider_view.dart';
import 'package:jepretin/app/modules/provider/offers/views/offers_view.dart';
import 'package:jepretin/app/modules/provider/manage_orders/views/manage_orders_view.dart';
import 'package:jepretin/app/modules/provider/profile_provider/views/profile_provider_view.dart';

class ProviderNavController extends GetxController {
  int selectedNavbar = 0;
  // bool isNavbarVisible = true;

  List<Widget> page = [
    HomeProviderView(),
    ManageOrdersView(),
    OffersView(),
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
