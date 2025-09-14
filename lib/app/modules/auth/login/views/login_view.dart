import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jepretin/app/shared/customButton.dart';
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
        builder: (controller) => SingleChildScrollView(
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
                      fontStyle: FontStyle.normal,
                      fontFamily: 'poppins',
                    ),
                  ),
                ],
              ),
              InputWithLabel(
                label: "",
                input: CustomInput(
                  hintText: "Email",
                  controller: TextEditingController(),
                  
                  onIconTap: () => {print("Hit")},
                ),
              ),
              SizedBox(height: 10),
              InputWithLabel(
                label: "",
                input: CustomInputAuth(
                  hintText: "Password",
                  controller: TextEditingController(),
                  icon: Icons.lock,
                ),
              ),
              SizedBox(height: 10),
              customAuthButton(
                text: "Masuk", 
              onTap: () => print("Anda menekan tombol masuk"),
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              ),

              SizedBox(height: 10),
              customAuthButton(
                text: "Daftar", 
              onTap: () => print("Anda menekan tombol daftar"),
              backgroundColor: Colors.blueGrey,
              textColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}