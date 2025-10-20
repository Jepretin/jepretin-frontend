import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jepretin/app/data/models/provider_model.dart';
import 'package:jepretin/app/data/models/role_model.dart';
import 'package:jepretin/app/data/request/provider_service.dart';

class UnggahPortoController extends GetxController {
  final RxList<File> selectedMedia = <File>[].obs;
  final RxBool isLoading = false.obs;
  final picker = ImagePicker();

  Future<void> pickMedia({bool isVideo = false}) async {
    if (isVideo) {
      final XFile? video = await picker.pickVideo(source: ImageSource.gallery);
      if (video != null) selectedMedia.add(File(video.path));
    } else {
      final List<XFile>? images = await picker.pickMultiImage();
      if (images != null && images.isNotEmpty) {
        selectedMedia.assignAll(images.map((e) => File(e.path)));
      }
    }
  }

  Future<void> uploadPortfolio() async {
    if (selectedMedia.isEmpty) {
      Get.snackbar("Gagal", "Pilih minimal 1 media terlebih dahulu");
      return;
    }

    try {
      isLoading.value = true;

      // 🔥 Kirim path file saja ke BE — nanti BE yang handle ke ImageKit
      final request = PortfolioRequest(
        media: selectedMedia.map((e) => e.path).toList(),
        mediaType: "Portfolio Photography",
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
        },
      );
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
