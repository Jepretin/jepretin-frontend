import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jepretin/app/themes/themes.dart';

import '../controllers/help_controller.dart';

class HelpView extends GetView<HelpController> {
  const HelpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pusat Bantuan'),
        centerTitle: true,
      ),
      body: GetBuilder(
        init: HelpController(),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 56,
                  width: 256,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: blackColor)),
                  ),
                  child: Row(
                    children: [
                      Text("Pusat Bantuan"),
                      Spacer(),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
                Container(
                  height: 56,
                  width: 256,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: blackColor)),
                  ),
                  child: Row(
                    children: [
                      Text("Pusat Bantuan"),
                      Spacer(),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
                Container(
                  height: 56,
                  width: 256,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: blackColor)),
                  ),
                  child: Row(
                    children: [
                      Text("Pusat Bantuan"),
                      Spacer(),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
                Container(
                  height: 56,
                  width: 256,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: blackColor)),
                  ),
                  child: Row(
                    children: [
                      Text("Pusat Bantuan"),
                      Spacer(),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
