import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/themes/themes.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: LoginController(),
        builder:
            (controller) => SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Column(
                children: [
                  Column(
                    children: [
                      Text(
                        "Masuk",
                        style: styletext(
                          fontsize: 32,
                          fontWeight: bold,
                          fontFamily: 'poppins',
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                  InputWithLabel(
                    label: "",
                    input: CustomInputAuth(
                      hintText: "Email",
                      controller: TextEditingController(),
                      icon: Icons.email,
                      onIconTap: () => {print("Hit")},
                    ),
                  ),
                  SizedBox(height: 14),
                  InputWithLabel(
                    label: "",
                    input: CustomInputAuth(
                      hintText: "Password",
                      controller: TextEditingController(),
                      icon: Icons.lock,
                      onIconTap: () => {print("Hit")},
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
