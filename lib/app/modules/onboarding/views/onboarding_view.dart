import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';
// import 'package:jepretin/app/themes/themes.dart'; // Import warna theme-mu jika butuh (primaryColor, dll)

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // --- BAGIAN ATAS: Tombol Lewati (Skip) ---
            Padding(
              padding: const EdgeInsets.only(top: 16, right: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () => controller.skip(),
                  child: Text(
                    "Lewati",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
            ),

            // --- BAGIAN TENGAH: Konten Slide (PageView) ---
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.onboardingData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Placeholder Gambar (Bisa kamu ganti dengan SvgPicture.asset / Image.asset nantinya)
                        Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.camera_alt_outlined, size: 100, color: Colors.blue),
                        ),
                        const SizedBox(height: 40),
                        
                        // Judul
                        Text(
                          controller.onboardingData[index]["title"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Deskripsi
                        Text(
                          controller.onboardingData[index]["description"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // --- BAGIAN BAWAH: Indikator & Tombol ---
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 40, top: 20),
              child: Column(
                children: [
                  // Indikator Titik (Dots)
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.onboardingData.length,
                        (index) => _buildDot(index: index),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // Tombol Utama (Teksnya dinamis)
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Obx(() {
                      bool isLastPage = controller.currentIndex.value == controller.onboardingData.length - 1;
                      
                      return ElevatedButton(
                        // Kamu bisa ganti ElevatedButton ini dengan CustomButton milikmu
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Ganti dengan primaryColor dari themes.dart
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () => controller.nextPage(),
                        child: Text(
                          isLastPage ? "Mulai Sekarang" : "Selanjutnya",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Pembuat Titik Indikator Animasi
  Widget _buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: controller.currentIndex.value == index ? 24 : 8, // Akan memanjang jika aktif
      decoration: BoxDecoration(
        color: controller.currentIndex.value == index ? Colors.blue : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}