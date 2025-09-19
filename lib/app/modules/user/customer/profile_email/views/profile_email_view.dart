import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_email_controller.dart';
import 'package:jepretin/app/shared/customCardContent.dart';

class ProfileEmailView extends GetView<ProfileEmailController> {
  const ProfileEmailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email'),
        centerTitle: true,
      ),
      body: GetBuilder(
        init: ProfileEmailController(),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            children: [
              CustomCardSingle(
                  child: Row(
                children: [
                  Icon(Icons.email),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Email@gmail.com', border: InputBorder.none),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
