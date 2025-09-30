import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jepretin/app/shared/customButton.dart';
import 'package:jepretin/app/shared/customCardContent.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/themes/themes.dart';

import '../controllers/ulasan_controller.dart';

class UlasanView extends GetView<UlasanController> {
  const UlasanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UlasanView'),
        centerTitle: true,
      ),
      body: GetBuilder(
        init: UlasanController(),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text("Pesanan",
                          style: styletext(
                            fontsize: 15,
                            fontWeight: bold,
                            color: textInputColor,
                          ),
                          textAlign: TextAlign.start),
                    ),
                    CustomCardSingle(
                      child: Column(
                        children: [
                          InputWithLabel(
                            label: "Provider",
                            input: CustomInput(
                                height: 50,
                                hintText: "Nama Provider",
                                controller: TextEditingController()),
                          ),
                          SizedBox(height: 25),
                          InputWithLabel(
                            label: "Produk Jasa",
                            input: CustomInput(
                                height: 50,
                                hintText: "Produk jasa yang disewa",
                                controller: TextEditingController()),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCardSingle(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              "Rating Jasa",
                              style: styletext(
                                fontsize: 15,
                                fontWeight: bold,
                                color: textInputColor,
                              ),
                            ),
                          ),
                          InputWithLabel(
                            label: "",
                            input: CustomInput(
                                height: 50,
                                hintText: "Dangat bagus. pelayanan terbaik ",
                                controller: TextEditingController()),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        // padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
        child: Column(children: [
          customButtonNormal(
            text: "Kirim Ulasan",
            onTap: () => {},
          ),
        ]),
      ),
    );
  }
}
