// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:jepretin/app/data/core/helper/token_manager.dart';
import 'package:jepretin/app/modules/user/home/views/home_view.dart';
import 'package:jepretin/app/modules/user/transaction/history/views/history_transaction_view.dart';
import 'package:jepretin/app/modules/user/promotion/views/promotion_view.dart';
import 'package:jepretin/app/modules/user/help/views/help_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get_cli/common/utils/json_serialize/json_ast/utils/grapheme_splitter.dart';

class UserNavController extends GetxController {
  int selectedNavbar = 0;
  // bool isNavbarVisible = true;

  List<Widget> page = [
    HomeView(),
    HistoryTransactionView(),
    PromotionView(),
    HelpView()
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
