import 'package:get/get.dart';

class PasswordEditController extends GetxController {
  var isLoading = false.obs; // untuk status loading kirim email
  var isCountdownActive = false.obs; // untuk status countdown

  Future<void> sendEmail() async {
    isLoading.value = true;

    try {
      // TODO: ganti bagian ini dengan request ke backend kamu
      await Future.delayed(Duration(seconds: 1)); // simulasi kirim email sukses
      isCountdownActive.value = true; // tampilkan countdown
    } catch (e) {
      Get.snackbar("Gagal", "Tidak dapat mengirim email");
    } finally {
      isLoading.value = false;
    }
  }

  void onCountdownFinished() {
    isCountdownActive.value = false; // setelah 1 menit, tombol muncul lagi
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
