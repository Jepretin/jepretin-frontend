import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jepretin/app/data/models/provider_model.dart';
import 'package:jepretin/app/data/models/role_model.dart';
import 'package:jepretin/app/data/request/provider_service.dart';

class UploadPortfolioController extends GetxController {
  final RxList<File> selectedMedia = <File>[].obs;
  final RxBool isLoading = false.obs;
  final RxString description = ''.obs;
  final RxString selectedType = 'image'.obs; // ✨ default: image
  final picker = ImagePicker();

  Future<void> pickMedia() async {
    if (selectedType.value == 'video') {
      final XFile? video = await picker.pickVideo(source: ImageSource.gallery);
      if (video != null) selectedMedia.assign([File(video.path)] as File);
    } else {
      final List<XFile>? image = await picker.pickMultiImage();
      if (image != null && image.isNotEmpty) {
        selectedMedia.assignAll(image.map((e) => File(e.path)));
      }
    }
  }

  Future<void> uploadPortfolio() async {
    if (selectedMedia.isEmpty) {
      Get.snackbar("Gagal", "Pilih minimal 1 media terlebih dahulu");
      return;
    }

    if (description.value.isEmpty) {
      Get.snackbar("Gagal", "Deskripsi tidak boleh kosong");
      return;
    }

    try {
      isLoading.value = true;

      final request = PortfolioRequest(
        media: selectedMedia.map((e) => e.path).toList(),
        mediaType: selectedType.value, // 🧠 kirim tipe media
        description: description.value,
      );

      final res = await ProviderService.uploadPortfolio(request);

      res.fold(
        (l) {
          Get.snackbar("Gagal", l.message ?? "Terjadi kesalahan");
          print("❌ Upload gagal: ${l.message}");
        },
        (r) {
          Get.snackbar("Sukses", "Portofolio berhasil diupload ✅");
          print("✅ Response: ${r.data}");
          description.value = '';
          selectedMedia.clear();
        },
      );
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}