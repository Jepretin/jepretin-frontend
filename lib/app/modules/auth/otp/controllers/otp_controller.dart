import 'dart:async';
import 'package:get/get.dart';
import 'package:jepretin/app/data/services/auth_service.dart';
import 'package:jepretin/app/data/models/auth_model.dart';

class OtpController extends GetxController {
  final isLoading = false.obs;
  late String email;

  final secondsRemaining = 60.obs;
  final enableResend = false.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    email = (Get.arguments as String?) ?? "";
    print("📩 Email dari register: $email"); // debug
    startTimer();
  }

  Future<void> verifyOtp(String otpCode) async {
    isLoading.value = true;

    final request = VerifyOtpRequest(email: email, otpCode: otpCode);

    final res = await AuthService.verifyOtpUser(request);

    res.fold(
      (l) => Get.snackbar("OTP Gagal", l.message ?? "Terjadi kesalahan"),
      (r) {
        print("✅ OTP sukses");
        Get.offAllNamed('/main');
      },
    );

    isLoading.value = false;
  }

  void startTimer() {
    secondsRemaining.value = 60;
    enableResend.value = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        enableResend.value = true;
        timer.cancel();
      }
    });
  }

  void resendOtp() async {
    // panggil API resend, gunakan this.email
    print("🔄 resend OTP ke $email");
    startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}