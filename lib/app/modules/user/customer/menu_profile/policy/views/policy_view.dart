import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/policy_controller.dart';

class PolicyView extends GetView<PolicyController> {
  const PolicyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PolicyView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PolicyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
