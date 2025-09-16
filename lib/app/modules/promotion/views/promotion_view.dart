import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:jepretin/app/themes/themes.dart';

import '../controllers/promotion_controller.dart';

class PromotionView extends GetView<PromotionController> {
  const PromotionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PromotionView'), centerTitle: true),
      body: GetBuilder(
        init: PromotionController(),
        builder:
            (controller) => SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'icons/coupon.svg',
                      width: 45,
                      height: 45,
                      color: textInputColor,
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
