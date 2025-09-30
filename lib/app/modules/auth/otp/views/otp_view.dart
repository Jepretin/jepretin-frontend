import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jepretin/app/themes/themes.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verifikasi OTP')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 25),
        child: Column(
          children: [
            const SizedBox(height: 100),
            Text(
              "Masukkan Kode",
              style: styletext(
                  fontsize: 32, fontWeight: bold, color: textInputColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              "Kode verifikasi telah dikirim melalui email ${controller.email}",
              style: styletext(
                  fontsize: 14, fontWeight: regular, color: textInputColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            OtpInput(),
            const SizedBox(height: 35),
            Obx(() {
              if (controller.enableResend.value) {
                return GestureDetector(
                  onTap: controller.resendOtp,
                  child: Text(
                    "Kirim ulang kode",
                    style: styletext(
                      fontsize: 14,
                      fontWeight: bold,
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                return Text(
                  "Apakah tidak menerima kode? Kirim ulang dalam 00:${controller.secondsRemaining.value.toString().padLeft(2, '0')}",
                  style: styletext(
                      fontsize: 14, fontWeight: regular, color: textInputColor),
                  textAlign: TextAlign.center,
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}

// Input OTP
class OtpInput extends StatelessWidget {
  final TextEditingController otpTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250,
        child: TextField(
          controller: otpTextController,
          maxLength: 6,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: styletext(
            fontsize: 32,
            fontWeight: medium,
            color: textInputColor,
            letterSpacing: 20,
          ),
          decoration: const InputDecoration(
            counterText: "",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
          ),
          onChanged: (value) {
            if (value.length == 6) {
              final otpCtrl = Get.find<OtpController>();
              otpCtrl.verifyOtp(value); // <- kirim langsung OTP dari input
            }
          },
        ),
      ),
    );
  }
}
