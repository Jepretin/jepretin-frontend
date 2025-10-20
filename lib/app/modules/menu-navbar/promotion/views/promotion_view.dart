import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jepretin/app/data/services/imagekit_endpoint.dart';
import 'package:jepretin/app/themes/themes.dart';

import '../controllers/promotion_controller.dart';

class PromotionView extends GetView<PromotionController> {
  const PromotionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PromotionView'),
        centerTitle: true,
      ),
      body: GetBuilder(
        init: PromotionController(),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 250),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.network(
                    // 'icons/promotion.svg',
                    ImagekitEndpoint.icon("promotion.svg"),
                    width: 80,
                    height: 80,
                    color: primaryColor.withOpacity(0.46),
                  ),
                  // SizedBox(height: 10),
                  Text(
                    "Segera Hadir",
                    style: styletext(
                        fontsize: 10,
                        fontWeight: semibold,
                        fontStyle: EnumFontStyle.italic,
                        color: disableColor),
                  ),
                  Text(
                    "Promo eksklusif akan segera tersedia. Nantikan kejutan hematnya!",
                    style: styletext(
                        fontsize: 9,
                        fontWeight: light,
                        fontStyle: EnumFontStyle.italic,
                        color: disableColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
