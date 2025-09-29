import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jepretin/app/shared/customButton.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/themes/themes.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lupa Kata Sandi'),
        titleTextStyle: styletext(
            fontsize: 19, fontWeight: semibold, color: textInputColor),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pop(context), // kembali ke halaman sebelumnya
        ),
      ),
      body: GetBuilder(
        init: ForgotPasswordController(),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 69, bottom: 10),
                child: Column(
                  children: [
                    Text(
                      "Kirim Kode",
                      style: styletext(
                          fontsize: 32, fontWeight: bold, color: primaryColor),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Silahkan masukkan akun email anda untuk mengirimkan tautan atur ulang kata sandi",
                        textAlign: TextAlign.center,
                        style: styletext(
                            fontsize: 12,
                            fontWeight: regular,
                            color: textInputColor),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Column(
                  children: [
                    InputWithLabel(
                      label: "",
                      input: CustomInput(
                        hintText: "Email",
                        controller: TextEditingController(),
                        onIconTap: () => {print("Hit")},
                        prefixIcon: 'icons/email.svg',
                      ),
                    ),
                  ],
                ),
              ),
              customAuthButton(
                text: "Kirim",
                onTap: () => {
                  // Get.to(() => KonfirmasiResetPassword()),
                  print("Anda menekan tombol Kirim Kode")
                },
                textColor: whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget TautanKodeEmail() {
  return Padding(
    padding: EdgeInsets.only(),
    child: Column(
      children: [
        Icon(Icons.done),
        Container(
          padding: EdgeInsets.only(top: 15),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "jika tidak menerima tautan silahkan klik kirim ulang",
            textAlign: TextAlign.center,
            style: styletext(
                fontsize: 12, fontWeight: regular, color: textInputColor),
          ),
        ),
      ],
    ),
  );
}

class KonfirmasiResetPassword extends StatelessWidget {
  const KonfirmasiResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 69, bottom: 15),
              child: Column(
                children: [
                  Text(
                    "Kata Sandi Baru",
                    style: styletext(
                        fontsize: 32, fontWeight: bold, color: primaryColor),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Buat kata sandi baru yang aman dan kuat",
                      textAlign: TextAlign.center,
                      style: styletext(
                          fontsize: 12,
                          fontWeight: regular,
                          color: textInputColor),
                    ),
                  ),
                  InputWithLabel(
                    label: "",
                    input: CustomInputAuth(
                      hintText: "Kata Sandi Baru",
                      controller: TextEditingController(),
                      Icon: 'icons/lock_key.svg',
                    ),
                  ),
                  InputWithLabel(
                    label: "",
                    input: CustomInputAuth(
                      hintText: "Konfirmasi Kata Sandi Baru",
                      controller: TextEditingController(),
                      Icon: 'icons/lock_key.svg',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  customAuthButton(
                    text: "Simpan",
                    onTap: () => print("Kata Sandi anda telah diperbarui"),
                    textColor: whiteColor,
                  ),
                  SizedBox(height: 15),
                  customAuthButton(
                      text: "Batal",
                      onTap: () => {
                            Get.back(),
                            print("Anda menekan tombol batal"),
                          },
                      textColor: primaryColor,
                      fillOpacity: 0.18),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
