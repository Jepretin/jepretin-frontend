import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jepretin/app/themes/themes.dart';

import '../controllers/profile_report_controller.dart';
import 'package:jepretin/app/shared/customCardContent.dart';
import 'package:jepretin/app/shared/customComponent.dart';

class ProfileReportView extends GetView<ProfileReportController> {
  const ProfileReportView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Laporkan'),
          centerTitle: true,
        ),
        body: GetBuilder(
            init: ProfileReportController(),
            builder: (controller) => SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(
                    children: [
                      InputWithLabel(
                          label: 'Laporkan Masalah',
                          input: CustomCardSingle(
                              child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Ketik penjelasan.....',
                                      border: InputBorder.none),
                                ),
                              )
                            ],
                          ))),
                      SizedBox(height: 20),
                      Container(
                        alignment: Alignment.center,
                        width: 162,
                        height: 127,
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 35,
                                  color: blackColor.withOpacity(0.25),
                                  spreadRadius: -5)
                            ]),
                        child: Icon(Icons.upload),
                      )
                    ],
                  ),
                )));
  }
}
