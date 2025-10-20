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
            child: Obx(
              () {
                return Column(
                  children: [
                    Wrap(
                      spacing: 10,
                      children: controller.selectedMedia
                          .map((file) =>
                              Image.file(file, width: 100, height: 100))
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () => controller.pickMedia(),
                      icon: const Icon(Icons.photo_library),
                      label: const Text("Pilih Media"),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : controller.uploadPortfolio,
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text("Upload Sekarang"),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
