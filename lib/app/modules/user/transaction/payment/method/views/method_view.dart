import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jepretin/app/shared/customButton.dart';
import 'package:jepretin/app/shared/customCardContent.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/themes/themes.dart';

import '../controllers/method_controller.dart';

class MethodView extends GetView<MethodController> {
  const MethodView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MethodView'),
        centerTitle: true,
      ),
      body: GetBuilder(
        init: MethodController(),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Wallet"),
                  CustomCardSingle(
                    child: Row(
                      children: [
                        Icon(Icons.wallet),
                        SizedBox(width: 15),
                        Text("Wallet"),
                        Spacer(),
                        Icon(Icons.chevron_right_sharp),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Kredit & Kartu Debit"),
                  CustomCardSingle(
                    child: Row(
                      children: [
                        Icon(Icons.wallet),
                        SizedBox(width: 15),
                        Text("Wallet"),
                        Spacer(),
                        Icon(Icons.chevron_right_sharp),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        // padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
        child: Column(children: [
          customButtonNormal(
            text: "Konfirmasi dan Bayar",
            onTap: () => {},
          ),
        ]),
      ),
    );
  }
}
