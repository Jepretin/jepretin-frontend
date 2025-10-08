import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jepretin/app/shared/customButton.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/themes/themes.dart';

import '../controllers/password_edit_controller.dart';
import 'package:jepretin/app/shared/customCardContent.dart';

class PasswordEditView extends GetView<PasswordEditController> {
  const PasswordEditView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kata Sandi'),
        centerTitle: true,
      ),
      body: GetBuilder(
        init: PasswordEditController(),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(30),
                ),
                Text(
                  "Ubah Kata Sandi",
                  style: TextStyle(
                      color: primaryColor, fontSize: 20, fontWeight: bold),
                ),
                SizedBox(height: 20),
                Text(
                  "Masukan email untuk mengubah kata sandi,\n"
                  "kami akan mengirimkan tautan untuk ubah kata sandi",
                  style: TextStyle(color: hintInputAuth, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                CustomCardSingle(
                  child: Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "email@gmail.com",
                            hintStyle: TextStyle(color: hintInputAuth),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.edit),
                    ],
                  ),
                ),
                Obx(() => controller.isCountdownActive.value
                    ? ResendCountdown(
                        message: "Apakah tidak menerima tautan ?",
                        onFInished: controller.onCountdownFinished,
                      )
                    : SizedBox.shrink()),
                ResendCountdown(message: "Apakah tidak menerima tautan ?"),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(() {
        if (controller.isCountdownActive.value) {
          return SizedBox.shrink();
        }

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // customAuthButton(
              //   text: controller.isLoading.value ? "Mengirim..." : "Kirim",
              //   onTap: controller.isLoading.value ? null : () async => await controller.sendEmail(),
              // ),
            ],
          ),
        );
      }),
    );
  }
}
