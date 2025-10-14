import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/unggah_porto_controller.dart';

class UnggahPortoView extends GetView<UnggahPortoController> {
  const UnggahPortoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UnggahPortoView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UnggahPortoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
