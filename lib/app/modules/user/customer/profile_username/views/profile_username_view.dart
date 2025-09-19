import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_username_controller.dart';
import 'package:jepretin/app/shared/customCardContent.dart';

class ProfileUsernameView extends GetView<ProfileUsernameController> {
  const ProfileUsernameView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nama Pengguna'),
        centerTitle: true,
      ),
      body: GetBuilder(
        init: ProfileUsernameController(),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            children: [
              CustomCardSingle(
                  child: Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Jhondoe', border: InputBorder.none),
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
