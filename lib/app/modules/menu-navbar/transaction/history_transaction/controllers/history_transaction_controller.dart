import 'package:get/get.dart';

class HistoryTransactionController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var isVisible = false.obs;

  void toggle() {
    isVisible.value = !isVisible.value;
  }
  void show() {
    isVisible.value = true;
  }
  void hide() {
    isVisible.value = false;
  }


}
