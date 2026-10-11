// lib/app/widgets/custom_text_field.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jepretin/app/core/themes/app_colors.dart';

// Import globals yang sudah kamu buat
import '../core/utils/font_styles.dart'; 
import '../core/utils/app_radius.dart'; // Import radius global-nya

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.controller,
    this.isPassword = false,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Get.isDarkMode;
    
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      style: styletext(
        fontsize: 14,
        fontWeight: regular,
        // color otomatis mengikuti tema
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: styletext(
          fontsize: 14,
          fontWeight: regular,
          color: Colors.grey, 
        ),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.grey) : null,
        suffixIcon: suffixIcon,
        
        filled: true,
        // Warna background beda antara light dan dark mode
        fillColor: isDark ? const Color(0xFF1F222A) : const Color(0xFFF5F5F5),
        
        // --- MENGGUNAKAN GLOBAL RADIUS (MD = 12px) ---
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadiusMD, // Super praktis!
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadiusMD, // Super praktis!
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
    );
  }
}