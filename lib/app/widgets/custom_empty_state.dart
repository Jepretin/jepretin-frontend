import 'package:flutter/material.dart';
import 'package:jepretin/app/core/themes/app_colors.dart';
import '../core/utils/font_styles.dart';
import 'custom_button.dart';

class CustomEmptyState extends StatelessWidget {
  final String imageAsset; // Bisa gambar aset lokal
  final IconData? fallbackIcon; // Ikon cadangan kalau tidak ada gambar
  final String title;
  final String description;
  final String? buttonText;
  final VoidCallback? onRetry;

  const CustomEmptyState({
    Key? key,
    this.imageAsset = '',
    this.fallbackIcon,
    required this.title,
    required this.description,
    this.buttonText,
    this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. ILUSTRASI / ICON
          if (imageAsset.isNotEmpty)
            Image.asset(imageAsset, height: 200)
          else if (fallbackIcon != null)
            Icon(fallbackIcon, size: 100, color: AppColors.neutral400)
          else
            const Icon(Icons.search_off_rounded, size: 100, color: AppColors.neutral400),
          
          const SizedBox(height: 24),
          
          // 2. JUDUL (Misal: "Fotografer Tidak Ditemukan")
          Text(
            title,
            textAlign: TextAlign.center,
            style: styletext(fontsize: 20, fontWeight: bold),
          ),
          const SizedBox(height: 12),
          
          // 3. DESKRIPSI (Misal: "Coba ganti kata kunci pencarianmu")
          Text(
            description,
            textAlign: TextAlign.center,
            style: styletext(
              fontsize: 14, 
              fontWeight: regular, 
              color: AppColors.neutral500,
            ),
          ),
          const SizedBox(height: 32),
          
          // 4. TOMBOL RETRY (Jika ada fungsi onRetry)
          if (onRetry != null)
            CustomButton(
              text: buttonText ?? 'Coba Lagi',
              isOutline: true, // Pakai gaya garis pinggir biar tidak terlalu mencolok
              width: 200,
              onPressed: onRetry,
            )
        ],
      ),
    );
  }
}