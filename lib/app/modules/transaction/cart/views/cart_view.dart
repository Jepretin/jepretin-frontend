import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jepretin/app/shared/customButton.dart';
import 'package:jepretin/app/shared/customCardContent.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/themes/themes.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartView'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Konten utama
          GetBuilder<CartController>(
            builder: (controller) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
                child: Column(
                  children: [
                    CustomCardSingle(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('images/monyet.jpg'),
                            radius: 35,
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nama Jasa",
                                style: styletext(
                                  fontsize: 15,
                                  fontWeight: semibold,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'poppins',
                                  color: textInputColor,
                                ),
                              ),
                              SizedBox(height: 4),
                              customButtonKecil(
                                text: "Edit",
                                onTap: () => {},
                                width: 70,
                                height: 20,
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            "Rp. 200.000",
                            style: styletext(
                              fontsize: 10,
                              fontWeight: semibold,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'poppins',
                              color: textInputColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          // Draggable sheet pakai GetBuilder juga
          GetBuilder<CartController>(
            builder: (controller) {
              return SharedDraggableSheet(
                initialSize: 0.45,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Bundle :"),
                      Row(
                        children: [
                          Text("-"),
                          Spacer(),
                          Text("Rp 0"),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 1,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: textInputColor.withOpacity(0.7),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Topping :"),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Unlimited Photo"),
                              Text("Drone"),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Rp 100.000"),
                              Text("Rp 250.000"),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 1,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: textInputColor.withOpacity(0.7),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Biaya Tambahan Transfer :"),
                      Row(
                        children: [
                          Text("-"),
                          Spacer(),
                          Text("Rp 2.500"),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 1,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: textInputColor.withOpacity(0.7),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [Text("Total"), Spacer(), Text("Rp.357.500")],
                  ),
                  SizedBox(height: 15),
                  customButtonNormal(
                    text: "Pesan",
                    onTap: () => {},
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
