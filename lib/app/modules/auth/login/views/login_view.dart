import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

import 'package:jepretin/app/shared/customComponent.dart';

import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('LoginView'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customTextField(
                  hintText: "Email",
                  prefixWidget: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      "assets/icons/email.svg",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                customTextField(
                    hintText: "Password",
                    isPassword: true,
                    prefixWidget: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          "assets/icons/lock_key.svg",
                          width: 20,
                          height: 20,
                        ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
