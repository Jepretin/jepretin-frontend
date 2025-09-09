import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LoginView'), centerTitle: true),
      body: const Center(
        child: Column(
          children: [
            Column(children: [Text("Masuk")]),
            SizedBox(height: 20),
            Column(
              
            ),
          ],
        ),
      ),
    );
  }
}
