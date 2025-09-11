import 'package:flutter/material.dart';
import 'package:jepretin/app/shared/customComponent.dart';

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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Column(
                children: [
                  // InputWithLabel(
                  //   label: "Nama Lengkap",
                  //   input: CustomInput(
                  //     hintText: "Masukkan Nama Lengkapmu",
                  //     controller: TextEditingController(),
                  //     suffixIcon: Icons.edit, // ✏️ icon di kanan
                  //     onIconTap: () {
                  //       print("Icon edit diklik");
                  //     },
                  //   ),
                  // ),
                  // SizedBox(height: 14),
                  // InputWithLabel(
                  //   label: "Alamat",
                  //   input: CustomInputAddress(
                  //     hintText: "Pilih Domisili kamu saat ini",
                  //     controller: TextEditingController(),
                  //     suffixIcon: Icons.location_city,
                  //     onIconTap: () {
                  //       print("Icon edit diklik");
                  //     },
                  //   ),
                  // ),
                  // SizedBox(height: 14),
                  // InputWithLabel(
                  //   label: "Detail Alamat",
                  //   input: CustomInput(
                  //     hintText: "Lengkapi detail alamat kamu",
                  //     controller: TextEditingController(),
                  //     suffixIcon: Icons.edit, // ✏️ icon di kanan
                  //     onIconTap: () {
                  //       print("Icon edit diklik");
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
      ),
    );
  }
}
