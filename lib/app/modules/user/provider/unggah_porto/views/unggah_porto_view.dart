import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/unggah_porto_controller.dart';

class UnggahPortoView extends GetView<UnggahPortoController> {
  const UnggahPortoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UnggahPortoView'),
        centerTitle: true,
      ),
      body: GetBuilder(
        init: UnggahPortoController(),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 24),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 🖼️ Preview media
                  if (controller.selectedMedia.isNotEmpty)
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      children: controller.selectedMedia.map((file) {
                        final ext = file.path.split('.').last.toLowerCase();
                        final isVideo = ['mp4', 'mov', 'avi'].contains(ext);

                        return Stack(
                          alignment: Alignment.topRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: isVideo
                                  ? Container(
                                      width: 100,
                                      height: 100,
                                      color: Colors.black12,
                                      child: const Icon(Icons.videocam,
                                          size: 40, color: Colors.blueGrey),
                                    )
                                  : Image.file(file,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover),
                            ),
                            Positioned(
                              top: 2,
                              right: 2,
                              child: InkWell(
                                onTap: () =>
                                    controller.selectedMedia.remove(file),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.all(3),
                                  child: const Icon(Icons.close,
                                      color: Colors.white, size: 16),
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    )
                  else
                    Container(
                      width: double.infinity,
                      height: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.photo_library_outlined,
                              size: 40, color: Colors.grey),
                          SizedBox(height: 8),
                          Text("Belum ada media yang dipilih",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13)),
                        ],
                      ),
                    ),

                  const SizedBox(height: 20),

                  // ✏️ Input deskripsi
                  TextField(
                    onChanged: (val) {
                      if (val.length <= 20) {
                        controller.description.value = val;
                      } else {
                        Get.snackbar(
                            "Melebihi Batas", "Deskripsi maksimal 20 huruf");
                      }
                    },
                    maxLength: 20,
                    decoration: InputDecoration(
                      labelText: "Deskripsi (max 20 huruf)",
                      counterText: '',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // 🎥 Pilihan tipe media
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ChoiceChip(
                        label: const Text("📷 Gambar"),
                        selected: controller.selectedType.value == 'image',
                        onSelected: (_) =>
                            controller.selectedType.value = 'image',
                        selectedColor: Colors.blueAccent,
                        labelStyle: TextStyle(
                          color: controller.selectedType.value == 'image'
                              ? Colors.white
                              : Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 10),
                      ChoiceChip(
                        label: const Text("🎥 Video"),
                        selected: controller.selectedType.value == 'video',
                        onSelected: (_) =>
                            controller.selectedType.value = 'video',
                        selectedColor: Colors.deepOrange,
                        labelStyle: TextStyle(
                          color: controller.selectedType.value == 'video'
                              ? Colors.white
                              : Colors.black87,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // 📁 Tombol pilih media
                  ElevatedButton.icon(
                    onPressed: () => controller.pickMedia(),
                    icon: const Icon(Icons.folder_open),
                    label: const Text("Pilih Media"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 🚀 Tombol upload
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : controller.uploadPortfolio,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: controller.isLoading.value
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text("Upload Sekarang"),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
