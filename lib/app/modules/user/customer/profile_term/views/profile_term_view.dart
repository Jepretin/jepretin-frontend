import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_term_controller.dart';
import 'package:jepretin/app/shared/customCardContent.dart';
import 'package:jepretin/app/shared/customComponent.dart';

class ProfileTermView extends GetView<ProfileTermController> {
  const ProfileTermView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syarat dan ketentuan'),
          centerTitle: true,
        ),
        body: GetBuilder(
            init: ProfileTermController(),
            builder: (controller) => SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(
                    children: [
                      InputWithLabel(
                          label: 'Syarat',
                          input: CustomCardSingle(
                              child: Row(
                            children: [
                              Text(
                                "Syarat\n\n"
                                "1. Syarat penggunaan.\n"
                                "2. Syarat penggunaan.\n"
                                ,
                              )
                            ],
                          ))),
                      InputWithLabel(
                          label: 'Ketentuan',
                          input: CustomCardSingle(
                              child: Row(
                            children: [
                              Text(
                                "Ketentuan\n\n"
                                "1. Ketentuan penggunaan.\n"
                                "2. Ketentuan penggunaan.\n"
                              )
                            ],
                          ))),
                    ],
                  ),
                )));
  }
}
