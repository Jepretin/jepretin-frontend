import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
// import 'package:jepretin/app/themes/themes.dart'; // Aktifkan jika butuh warna dari theme-mu

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background abu-abu sangat muda agar Card warna putih nantinya lebih menonjol
      backgroundColor: Colors.grey.shade50, 
      
      body: SafeArea(
        // extendBody tidak diperlukan di HomeView, karena extendBody itu tugasnya MainView
        child: SingleChildScrollView(
          // 🔥 RAHASIA UTAMA: Padding bawah 120 wajib ada agar konten tidak dimakan Navbar
          padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildSearchBar(),
              const SizedBox(height: 32),
              _buildCategories(),
              const SizedBox(height: 32),
              _buildRecommendedSection(),
            ],
          ),
        ),
      ),
    );
  }

  // --- 1. HEADER (Sapaan & Notifikasi) ---
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lokasi saat ini',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.black87),
                const SizedBox(width: 4),
                const Text(
                  'Kediri, Jawa Timur',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.keyboard_arrow_down, size: 16),
              ],
            ),
          ],
        ),
        // Tombol Notifikasi
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: const Icon(Icons.notifications_outlined, size: 20),
        )
      ],
    );
  }

  // --- 2. SEARCH BAR ---
  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey.shade400),
          const SizedBox(width: 12),
          Text(
            'Cari fotografer atau MUA...',
            style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
          ),
        ],
      ),
    );
  }

  // --- 3. KATEGORI (Grid/Row) ---
  Widget _buildCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Kategori Layanan',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildCategoryItem(Icons.camera_alt_outlined, 'Wedding'),
            _buildCategoryItem(Icons.school_outlined, 'Wisuda'),
            _buildCategoryItem(Icons.face_retouching_natural, 'MUA'),
            _buildCategoryItem(Icons.fastfood_outlined, 'Produk'),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryItem(IconData icon, String title) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white, // Ganti dengan warna primary-mu versi transparan jika mau
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(icon, color: Colors.black87), // Nanti bisa diganti SVG
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  // --- 4. SECTION REKOMENDASI (List Card) ---
  Widget _buildRecommendedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Rekomendasi Terdekat',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Lihat Semua',
              style: TextStyle(fontSize: 12, color: Colors.blue.shade600, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 16),
        
        // Dummy Card List (Nanti datanya di-mapping dari Controller)
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(), // Scroll mati, ikut SingleChildScrollView
          itemCount: 5, 
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            return Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: const Center(
                child: Text('Card Fotografer (Slicing Nanti)'),
              ),
            );
          },
        ),
      ],
    );
  }
}