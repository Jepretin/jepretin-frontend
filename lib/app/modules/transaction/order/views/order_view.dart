import 'package:flutter/material.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/shared/customBottomCard.dart';

import 'package:get/get.dart';
import 'package:jepretin/app/themes/themes.dart';

import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pesan Jasa'), centerTitle: true),
      body: GetBuilder(
        init: OrderController(),
        builder:
            (controller) => SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
              child: Column(
                children: [
                  InputWithLabel(
                    label: "Nama Lengkap",
                    input: CustomInput(
                      hintText: "Masukkan Nama Lengkapmu",
                      controller: TextEditingController(),
                      suffixIcon: Icons.edit, // ✏️ icon di kanan
                      onIconTap: () {
                        print("Icon edit diklik");
                      },
                    ),
                  ),
                  SizedBox(height: 14),
                  InputWithLabel(
                    label: "Alamat",
                    input: CustomAddressInput(
                      hintText: "Pilih Domisili kamu saat ini",
                      controller: TextEditingController(),
                      suffixIcon: Icons.location_city,
                      onIconTap: () {
                        print("Icon edit diklik");
                      },
                    ),
                  ),
                  SizedBox(height: 14),
                  InputWithLabel(
                    label: "Detail Alamat",
                    input: CustomInput(
                      hintText: "Lengkapi detail alamat kamu",
                      controller: TextEditingController(),
                      suffixIcon: Icons.edit, // ✏️ icon di kanan
                      onIconTap: () {
                        print("Icon edit diklik");
                      },
                    ),
                  ),
                  SizedBox(height: 14),
                  DateTimeInput(),
                  SizedBox(height: 14),
                  InputWithLabel(
                    label: "Pilih rovider",
                    input: CustomProviderInput(
                      hintText: "Pilih disini",
                      controller: TextEditingController(),
                      suffixIcon: Icons.edit,
                      onIconTap: () {
                        print("Hit");
                      },
                    ),
                  ),
                  SizedBox(height: 14),
                  InputWithLabel(
                    label: "Pilih Produk Jasa",
                    input: CustomProviderInput(
                      hintText: "Pilih provider terlebih dahulu",
                      controller: TextEditingController(),
                      suffixIcon: Icons.edit,
                      onIconTap: () {
                        print("Hit");
                      },
                    ),
                  ),
                ],
              ),
            ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(21),
            topRight: Radius.circular(21),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // biar tingginya menyesuaikan konten
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Baris pertama: Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: styletext(
                    fontsize: 17,
                    fontWeight: bold,
                    fontFamily: "poppins",
                    fontStyle: FontStyle.normal,
                    color: textInputColor.withOpacity(0.7),
                  ),
                ),
                Text(
                  "Rp. 0",
                  style: styletext(
                     fontsize: 18,
                    fontWeight: bold,
                    fontFamily: "poppins",
                    fontStyle: FontStyle.normal,
                    color: textInputColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Baris kedua: Icon + Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Icon lingkaran
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blueGrey, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.blueGrey,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),

                // Tombol Pesan
                ElevatedButton(
                  onPressed: () {
                    // aksi pesan
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF03314B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 18,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Pesan",
                        style: styletext(
                          fontsize: 13,
                          fontWeight: semibold,
                          fontFamily: "poppins",
                          fontStyle: FontStyle.normal,
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
