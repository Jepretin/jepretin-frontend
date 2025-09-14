import 'package:flutter/cupertino.dart';
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
              Column(
                children: [
                  Text(
                    "Daftar",
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
          
                ),
              ),
              SizedBox(height: 10),
              InputWithLabel(
                label: "",
                input: CustomInput(
                  hintText: "Nama Lengkap",
                  controller: TextEditingController(),
                  // icon: Icons.lock,
                ),
              ),
              SizedBox(height: 10),
              InputWithLabel(
                label: "",
                input: CustomInputAuth(
                  hintText: "Kata Sandi",
                  controller: TextEditingController(),
                  icon: Icons.lock,
                ),
              ),
              SizedBox(height: 10),
              InputWithLabel(
                label: "",
                input: CustomInputAuth(
                  hintText: "Konfirmasi Kata Sandi",
                  controller: TextEditingController(),
                  icon: Icons.lock,
                ),
              ),
              SizedBox(height: 10),
              customAuthButton(
                text: "Daftar", 
              onTap: () => print("Anda menekan tombol masuk"),
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              ),

              SizedBox(height: 10),
              customAuthButton(
                text: "Daftar", 
              onTap: () => print("Anda menekan tombol daftar"),
              backgroundColor: const Color.fromARGB(255, 250, 250, 250),
              textColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}