import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:jepretin/app/shared/customCardContent.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import '../controllers/profile_edit_controller.dart';

class ProfileEditView extends GetView<ProfileEditController> {
  const ProfileEditView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ubah Profil'),
          centerTitle: true,
        ),
        body: GetBuilder(
          init: ProfileEditController(),
          builder: (controller) => SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Center(
              child: Column(
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    CustomCardMultiple(children: [
                      CustomMenu(
                          leadingIcon: Icons.photo_camera,
                          placeholder: 'Foto Profil',
                          trailingIcon: Icons.chevron_right),
                      SizedBox(height: 20),
                      CustomMenu(
                          leadingIcon: Icons.person,
                          placeholder: 'Jhon doe',
                          trailingIcon: Icons.chevron_right),
                      SizedBox(height: 20),
                      CustomMenu(
                          leadingIcon: Icons.email,
                          placeholder: 'email***@gmail.com',
                          trailingIcon: Icons.chevron_right),
                      SizedBox(height: 20),
                    ]),
                  ])
                ],
              ),
            ),
          ),
        ));
  }
}
