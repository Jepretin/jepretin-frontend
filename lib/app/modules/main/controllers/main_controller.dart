import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:jepretin/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/common/utils/json_serialize/json_ast/utils/grapheme_splitter.dart';

class MainController extends GetxController {
  int selectedNavbar = 0;

  List<Widget> page = [HomeView(), Container(), Container(), Container()];

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
