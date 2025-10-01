import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:jepretin/app/shared/customComponent.dart';
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
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  CustomDropdown(
                    title: "Pusat Bantuan",
                    children: [
                      Text("data"),
                      SizedBox(height: 8),
                      Text("data"),
                    ],
                  ),
                  CustomDropdown(
                    title: "Pusat Bantuan",
                    children: [
                      Text("data"),
                      SizedBox(height: 8),
                      Text("data"),
                    ],
                  ),
                  CustomDropdown(
                    title: "Pusat Bantuan",
                    children: [
                      Text("data"),
                      SizedBox(height: 8),
                      Text("data"),
                    ],
                  ),
                  CustomDropdown(
                    title: "Pusat Bantuan",
                    children: [
                      Text("data"),
                      SizedBox(height: 8),
                      Text("data"),
                    ],
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
