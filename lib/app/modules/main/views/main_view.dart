// lib/app/modules/main/views/main_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

// Import View dari 4 halaman utama
import '../../home/views/home_view.dart';
// import '../../transaction/history/views/history_transaction_view.dart';
// import '../../promotion/views/promotion_view.dart';
// import '../../help/views/help_view.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Kumpulan 4 halaman sesuai referensi project lamamu
    final List<Widget> pages = [
      const HomeView(),
      const HomeView(),
      const HomeView(),
      const HomeView(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      // Wajib true agar halaman menembus ke bawah navbar
      extendBody: true, 
      
      // Menampilkan halaman sesuai index yang dipilih
      body: Obx(() => pages[controller.selectedIndex.value]), 
      
      // Floating Pill Navbar
      bottomNavigationBar: _buildFloatingPillNavbar(),
    );
  }

  Widget _buildFloatingPillNavbar() {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40), // Bentuk Pill / Lonjong
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              icon: Icons.home_outlined, 
              activeIcon: Icons.home, 
              index: 0,
            ),
            _buildNavItem(
              icon: Icons.receipt_long_outlined, 
              activeIcon: Icons.receipt_long, 
              index: 1,
            ),
            _buildNavItem(
              icon: Icons.discount_outlined, 
              activeIcon: Icons.discount, 
              index: 2,
            ),
            _buildNavItem(
              icon: Icons.help_outline, 
              activeIcon: Icons.help, 
              index: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required int index,
  }) {
    final isSelected = controller.selectedIndex.value == index;
    
    return GestureDetector(
      onTap: () => controller.changePage(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(8),
        child: Icon(
          isSelected ? activeIcon : icon, 
          // Pakai warna hitam elegan saat aktif, abu-abu saat tidak aktif
          color: isSelected ? Colors.black87 : Colors.grey.shade400, 
          size: 28,
        ),
      ),
    );
  }
}