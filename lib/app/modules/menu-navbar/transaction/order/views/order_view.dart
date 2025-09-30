import 'package:flutter/material.dart';
import 'package:jepretin/app/shared/customComponent.dart';
// import 'package:jepretin/app/shared/customCardContent.dart';

import 'package:get/get.dart';
import 'package:jepretin/app/themes/themes.dart';

import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: GetBuilder(
        init: OrderController(),
        builder: (controller) => SingleChildScrollView(
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
                input:  PilihProdukJasa()
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
                    color: textInputColor.withOpacity(0.7),
                  ),
                ),
                Text(
                  "Rp. 0",
                  style: styletext(
                    fontsize: 18,
                    fontWeight: bold,
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

class PilihProdukJasa extends StatelessWidget {
  const PilihProdukJasa({super.key});

  void _showProdukPopup(BuildContext context) async {
    final result = await showModalBottomSheet<String>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        int selectedIndex = 0;
        String? selectedItem;

        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Switch Button
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildSwitchButton(
                          title: "Bundle",
                          isSelected: selectedIndex == 0,
                          onTap: () => setState(() => selectedIndex = 0),
                        ),
                        _buildSwitchButton(
                          title: "Topping",
                          isSelected: selectedIndex == 1,
                          onTap: () => setState(() => selectedIndex = 1),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Isi sesuai pilihan
                  if (selectedIndex == 0) ...[
                    ListTile(
                      title: const Text("Paket Wedding 1"),
                      onTap: () {
                        selectedItem = "Paket Wedding 1";
                        Navigator.pop(
                            context, selectedItem); // <<-- balik value
                      },
                    ),
                    ListTile(
                      title: const Text("Paket Wedding 2"),
                      onTap: () {
                        selectedItem = "Paket Wedding 2";
                        Navigator.pop(context, selectedItem);
                      },
                    ),
                  ] else ...[
                    ListTile(
                      title: const Text("Drone Camera"),
                      onTap: () {
                        selectedItem = "Drone Camera";
                        Navigator.pop(context, selectedItem);
                      },
                    ),
                    ListTile(
                      title: const Text("Lighting Extra"),
                      onTap: () {
                        selectedItem = "Lighting Extra";
                        Navigator.pop(context, selectedItem);
                      },
                    ),
                  ],
                ],
              ),
            );
          },
        );
      },
    );

    if (result != null) {
      print("✅ User memilih: $result");
      // Di sini bisa update state/controller sesuai pilihan
    }
  }

  Widget _buildSwitchButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showProdukPopup(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Pilih provider terlebih dahulu",
              style: TextStyle(color: Colors.grey),
            ),
            Icon(Icons.edit, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
