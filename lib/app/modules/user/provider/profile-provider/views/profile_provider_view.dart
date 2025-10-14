import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_provider_controller.dart';

class ProfileProviderView extends GetView<ProfileProviderController> {
  const ProfileProviderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileProviderView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileProviderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
