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
                        fontsize: 32, fontWeight: bold, color: primaryColor),
                  ),
                ],
              ),
              SizedBox(height: 58),
              InputWithLabel(
                label: "",
                input: CustomInput(
                    width: 301,
                    hintText: "Nama Lengkap",
                    controller: controller.nameController,
                    prefixIcon: 'user.svg'),
              ),
              InputWithLabel(
                label: "",
                input: CustomInput(
                  width: 301,
                  hintText: "Email",
                  controller: controller.emailController,
                  prefixIcon: 'email.svg',
                ),
              ),
              InputWithLabel(
                label: "",
                input: CustomInputAuth(
                  hintText: "Konfirmasi Kata Sandi",
                  controller: controller.passwordController,
                  iconName: 'lock_key.svg',
                ),
              ),
              InputWithLabel(
                label: "",
                input: CustomInput(
                  width: 301,
                  hintText: "Phone Number",
                  controller: controller.phoneController,
                  prefixIcon: 'user.svg',
                ),
              ),
              SizedBox(height: 44),
                 Obx(
                () => customAuthButton(
                  text: controller.isLoading.value ? "Loading" : "Daftar",
                  onTap: () {
                    controller.register();
                    print("Menekan Tombol Daftar");
                  },
                  textColor: whiteColor,
                ),
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
                      color: hintInputAuth,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      " Masuk",
                      style: styletext(
                        fontsize: 13,
                        fontWeight: regular,
                        color: primaryColor,
                      ),
                    ),
                    onTap: () => {
                      Get.toNamed('/login'),
                      print("Anda menekan 'Sudah memiliki akun? Masuk'"),
                    },
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
