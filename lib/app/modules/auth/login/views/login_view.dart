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
              Padding(
                padding: EdgeInsets.only(top: 69, bottom: 15),
                child: Column(
                  children: [
                    Text(
                      "Masuk",
                      style: styletext(
                          fontsize: 32, fontWeight: bold, color: primaryColor),
                    ),
                    InputWithLabel(
                      label: "",
                      input: CustomInput(
                        width: 301,
                        hintText: "Email",
                        controller: TextEditingController(),
                        onIconTap: () => {print("Hit")},
                        prefixIcon: 'icons/email.svg',
                      ),
                    ),
                    InputWithLabel(
                      label: "",
                      input: CustomInputAuth(
                        hintText: "Password",
                        controller: TextEditingController(),
                        Icon: 'icons/lock_key.svg',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 301,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    child: Text(
                      "Lupa kata sandi?",
                      style: styletext(
                        fontsize: 13,
                        fontWeight: regular,
                        color: primaryColor,
                      ),
                    ),
                    onTap: () => {
                      Get.toNamed('/forgot-password'),
                      print("Anda menekan 'Lupa kata sandi?'"),
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 85),
                child: Column(
                  children: [
                    customAuthButton(
                      text: "Masuk",
                      onTap: () => print("Anda menekan tombol masuk"),
                      textColor: whiteColor,
                    ),
                    SizedBox(height: 15),
                    customAuthButton(
                        text: "Daftar",
                        onTap: () => {
                              Get.toNamed('/register'),
                              print("Anda menekan tombol daftar"),
                            },
                        textColor: primaryColor,
                        fillOpacity: 0.18),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
