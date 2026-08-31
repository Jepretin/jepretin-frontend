import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jepretin/app/routes/app_pages.dart';

class OnboardingController extends GetxController {
  // Pengendali geser halaman
  final PageController pageController = PageController();
  
  // Penyimpan index halaman saat ini (0 = slide 1, 1 = slide 2, 2 = slide 3)
  final RxInt currentIndex = 0.obs;

  // Data konten onboarding (Bisa kamu ganti ilustrasinya nanti)
  final List<Map<String, String>> onboardingData = [
    {
      "title": "Temukan Fotografer Terbaik",
      "description": "Cari dan pesan jasa fotografer atau videografer profesional di sekitarmu dengan mudah.",
      "image": "assets/images/onboarding1.png", // Ganti path sesuai asetmu nanti
    },
    {
      "title": "Booking Cepat & Aman",
      "description": "Atur jadwal, pilih paket sesuai budget, dan bayar dengan aman langsung dari aplikasi.",
      "image": "assets/images/onboarding2.png", 
    },
    {
      "title": "Abadikan Momenmu!",
      "description": "Tunggu fotografer datang ke lokasimu, dan bersiaplah mendapatkan hasil foto yang menakjubkan.",
      "image": "assets/images/onboarding3.png", 
    },
  ];

  // Dipanggil saat layar digeser (swipe) secara manual
  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  // Fungsi untuk tombol "Selanjutnya" / "Mulai"
  void nextPage() async {
    if (currentIndex.value < onboardingData.length - 1) {
      // Jika belum di slide terakhir, geser ke slide berikutnya
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Jika sudah di slide terakhir, selesaikan onboarding
      await _finishOnboarding();
    }
  }

  // Fungsi untuk tombol "Lewati" (Skip)
  void skip() async {
    await _finishOnboarding();
  }

  // Fungsi inti untuk mencatat memori & pindah halaman
  Future<void> _finishOnboarding() async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'hasSeenOnboarding', value: 'true'); // Tulis ke buku catatan HP
    
    // Pindah ke MainView (Hapus tumpukan rute sebelumnya)
    Get.offAllNamed(Routes.MAIN); 
  }

  @override
  void onClose() {
    pageController.dispose(); // Bersihkan memori saat controller ditutup
    super.onClose();
  }
}