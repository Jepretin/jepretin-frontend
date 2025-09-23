import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/regis_provider_controller.dart';

class RegisProviderView extends GetView<RegisProviderController> {
  const RegisProviderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisProviderView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RegisProviderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
