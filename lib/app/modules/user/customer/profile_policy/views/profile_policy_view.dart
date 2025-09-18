import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_policy_controller.dart';

class ProfilePolicyView extends GetView<ProfilePolicyController> {
  const ProfilePolicyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfilePolicyView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfilePolicyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
