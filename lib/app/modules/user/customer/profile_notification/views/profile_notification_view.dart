import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../controllers/profile_notification_controller.dart';
import 'package:jepretin/app/shared/customCardContent.dart';
import 'package:jepretin/app/shared/customComponent.dart';

class ProfileNotificationView extends GetView<ProfileNotificationController> {
  const ProfileNotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notifikasi'),
          centerTitle: true,
        ),
        body: GetBuilder(
            init: ProfileNotificationController(),
            builder: (controller) => SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(
                    children: [
                      InputWithLabel(
                        label: 'Notifikasi',
                        input: CustomCardSingle(
                            child: Row(
                          children: [
                            Text('Email'),
                            Spacer(),
                            Icon(Icons.radio)
                          ],
                        )),
                      ),
                      CustomCardSingle(
                          child: Row(
                        children: [
                          Text('Promosi'),
                          Spacer(),
                          Icon(Icons.radio)
                        ],
                      )),
                      CustomCardSingle(
                          child: Row(
                        children: [
                          Text('Status Pesanan'),
                          Spacer(),
                          Icon(Icons.radio)
                        ],
                      )),
                    ],
                  ),
                )));
  }
}
