import 'package:jepretin/app/modules/transaction/order/views/order_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/common/utils/json_serialize/json_ast/utils/grapheme_splitter.dart';

class OrderController extends GetxController {
  int selectedNavbar = 0;

  List<Widget> page = [OrderView(), Container(), Container(), Container()];

  void onChangeIndex(int index) {
    selectedNavbar = index;
    print("index: ${selectedNavbar}");
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
