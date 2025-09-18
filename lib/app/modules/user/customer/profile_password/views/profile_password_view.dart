import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_password_controller.dart';

class ProfilePasswordView extends GetView<ProfilePasswordController> {
  const ProfilePasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfilePasswordView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfilePasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
