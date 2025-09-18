import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_term_controller.dart';

class ProfileTermView extends GetView<ProfileTermController> {
  const ProfileTermView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileTermView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileTermView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
