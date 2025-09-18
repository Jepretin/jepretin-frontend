import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_email_controller.dart';

class ProfileEmailView extends GetView<ProfileEmailController> {
  const ProfileEmailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileEmailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileEmailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
