import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jepretin/app/shared/customButton.dart';
import 'package:jepretin/app/shared/customCardContent.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/themes/themes.dart';

import '../controllers/confirm_pembayaran_controller.dart';

class ConfirmPembayaranView extends GetView<ConfirmPembayaranController> {
  const ConfirmPembayaranView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Pembayaran'),
        centerTitle: true,
      ),
      body: GetBuilder(
        init: ConfirmPembayaranController(),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pesanan"),
                  CustomCardMultiple(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Provider"),
                          SizedBox(height: 12),
                          CustomInput(
                              hintText: 'xxxxx',
                              controller: TextEditingController()),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Produk Jasa"),
                          SizedBox(height: 12),
                          CustomInput(
                              hintText: 'xxxxx',
                              controller: TextEditingController()),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pesanan"),
                  CustomCardMultiple(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Provider"),
                          SizedBox(height: 12),
                          CustomInput(
                              hintText: 'xxxxx',
                              controller: TextEditingController()),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        // padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
        child: Column(children: [
          customButtonNormal(
            text: "Konfirmasi dan Bayar",
            onTap: () => {},
          ),
        ]),
      ),
    );
  }
}
