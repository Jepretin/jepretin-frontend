import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jepretin/app/themes/themes.dart';
import 'package:jepretin/app/shared/customButton.dart';
import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FavoriteView'),
          centerTitle: true,
        ),
        body: GetBuilder(
            init: FavoriteController(),
            builder: (controller) => SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 158,
                                height: 128,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: blackColor.withOpacity(0.15),
                                          blurRadius: 35)
                                    ]),
                              ),
                              SizedBox(width: 32),
                              Container(
                                width: 158,
                                height: 128,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: blackColor.withOpacity(0.15),
                                          blurRadius: 35)
                                    ]),
                              ),
                            ]),
                      ],
                    ),
                  ),
                )));
  }
}
