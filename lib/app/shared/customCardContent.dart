import 'package:flutter/material.dart';
import 'package:jepretin/app/themes/themes.dart';

class SharedCard extends StatelessWidget {
  final String profileImage;
  final String title;
  final String subtitle;
  final String mainImage;
  final int likes;
  final VoidCallback onLike;
  final VoidCallback onOrder;
  final bool isPortrait; // ✅ tambahan

  const SharedCard({
    super.key,
    required this.profileImage,
    required this.title,
    required this.subtitle,
    required this.mainImage,
    required this.likes,
    required this.onLike,
    required this.onOrder,
    this.isPortrait = false, // default = layout awal (4:3)
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(profileImage),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_vert),
              ],
            ),
            const SizedBox(height: 10),

            // Main Image
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: isPortrait
                  ? Image.asset(
                      mainImage,
                      fit: BoxFit.cover,
                      width: double.infinity, // ✅ lebar penuh card
                    )
                  : AspectRatio(
                      aspectRatio: 4 / 3,
                      child: Image.asset(
                        mainImage,
                        fit: BoxFit.cover,
                        width: double.infinity, // biar tetap full juga
                      ),
                    ),
            ),

            const SizedBox(height: 10),

            // Footer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: onLike,
                      child: const Icon(Icons.favorite, color: Colors.red),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "$likes",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: onOrder,
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("Pesan"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

CustomCardProfile({
  required Widget child,
  required String profileImage,
}) {
  return Card(
    color: whiteColor,
    shadowColor: primaryColor.withOpacity(0.6),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 3,
    margin: const EdgeInsets.symmetric(vertical: 17, horizontal: 12),
    child: Padding(
      padding: const EdgeInsets.all(28),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Foto profil
          CircleAvatar(
            backgroundImage: AssetImage(profileImage),
            radius: 28,
          ),
          const SizedBox(width: 15),
          // Konten tambahan (dari parameter child)
          Expanded(child: child),
        ],
      ),
    ),
  );
}

CustomCardSingle({
  required Widget child,
}) {
  return Card(
    color: whiteColor,
    shadowColor: primaryColor.withOpacity(0.6),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 3,
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: child, // <-- isi card
    ),
  );
}

CustomCardMultiple({
  required List<Widget> children,
}) {
  return Card(
    color: Colors.white,
    shadowColor: Colors.blue.withOpacity(0.6),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 3,
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    child: Padding(
      padding: const EdgeInsets.all(15), // biar gak mepet
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    ),
  );
}