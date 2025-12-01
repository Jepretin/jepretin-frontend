import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jepretin/app/shared/customComponent.dart';

import '../controllers/offers_controller.dart';

class OffersView extends GetView<OffersController> {
  const OffersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OffersView'),
        centerTitle: true,
      ),
      body: GetBuilder(
        init: OffersController(),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 25),
          child: Column(
            children: [
              ToppingListSection(
                toppings: [
                  ToppingItemModel("Keju", "Rp. 5.000"),
                  ToppingItemModel("Coklat", "Rp. 4.000"),
                  ToppingItemModel("Oreo", "Rp. 6.000"),
                ],
                onAddTap: () {
                  print("Tambah topping diklik");
                },
                onSeeAllTap: () {
                  print("Lihat semua diklik");
                },
              ), 
              ToppingListSection(
                toppings: [
                  ToppingItemModel("Keju", "Rp. 5.000"),
                  ToppingItemModel("Coklat", "Rp. 4.000"),
                  ToppingItemModel("Oreo", "Rp. 6.000"),
                ],
                onAddTap: () {
                  print("Tambah topping diklik");
                },
                onSeeAllTap: () {
                  print("Lihat semua diklik");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
