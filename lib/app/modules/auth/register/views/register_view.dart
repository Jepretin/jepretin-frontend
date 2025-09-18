import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jepretin/app/shared/customButton.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/themes/themes.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: RegisterController(),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            children: [
              SizedBox(height: 58),
              Column(
                children: [
                  Text(
                    "Daftar",
                    style: styletext(
                        fontsize: 32,
                        fontWeight: bold,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'poppins',
                        color: primaryColor),
                  ),
                ],
              ),
              SizedBox(height: 58),
              InputWithLabel(
                label: "",
                input: CustomInput(
                  hintText: "Email",
                  controller: TextEditingController(),
                  prefixIcon: 'assets/icons/email.svg',
                ),
              ),
              InputWithLabel(
                label: "",
                input: CustomInput(
                    hintText: "Nama Lengkap",
                    controller: TextEditingController(),
                    prefixIcon: 'assets/icons/user.svg'),
              ),
              InputWithLabel(
                label: "",
                input: CustomInputAuth(
                  hintText: "Kata Sandi",
                  controller: TextEditingController(),
                  Icon: 'assets/icons/lock_key.svg',
                ),
              ),
              InputWithLabel(
                label: "",
                input: CustomInputAuth(
                  hintText: "Konfirmasi Kata Sandi",
                  controller: TextEditingController(),
                  Icon: 'assets/icons/lock_key.svg',
                ),
              ),
              SizedBox(height: 44),
              customAuthButton(
                text: "Daftar",
                onTap: () => print("Anda menekan tombol masuk"),
                textColor: whiteColor,
              ),
              SizedBox(height: 27),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sudah memiliki akun?",
                    style: styletext(
                      fontsize: 13,
                      fontWeight: regular,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'poppins',
                      color: hintInputAuth,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      " Masuk",
                      style: styletext(
                        fontsize: 13,
                        fontWeight: regular,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'poppins',
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
