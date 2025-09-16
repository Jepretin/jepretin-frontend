// import 'package:jepretin/app/themes/themes.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';

// class CustomBottomBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Contoh Bottom Bar")),
//       bottomNavigationBar: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 8,
//               offset: Offset(0, -2),
//             ),
//           ],
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(16),
//             topRight: Radius.circular(16),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // Bagian kiri: Total
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: const [
//                 Text(
//                   "Total",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   "Rp. 0",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),

//             // Bagian kanan: Icon + Button
//             Row(
//               children: [
//                 // Icon lingkaran
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.blueGrey, width: 1),
//                   ),
//                   child: const Icon(Icons.shopping_cart,
//                       color: Colors.blueGrey, size: 20),
//                 ),
//                 const SizedBox(width: 12),

//                 // Tombol Pesan
//                 ElevatedButton(
//                   onPressed: () {
//                     // aksi pesan
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF03314B),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 40,
//                       vertical: 14,
//                     ),
//                   ),
//                   child: const Text(
//                     "Pesan",
//                     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

