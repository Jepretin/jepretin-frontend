import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jepretin/app/shared/customCardContent.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/themes/themes.dart';

import '../controllers/manage_orders_controller.dart';

class ManageOrdersView extends GetView<ManageOrdersController> {
  const ManageOrdersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ManageOrdersView'),
        centerTitle: true,
      ),
      body: GetBuilder(
        init: ManageOrdersController(),
        builder: (controller) => SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Daftar Pesanan",
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: semibold,
                          fontSize: 19),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CustomCardProfile(
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Peh potret",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: semibold,
                                    fontSize: 12),
                              ),
                              SizedBox(height: 5),
                              StatusBadge(status: OrderStatus.complete)
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                // onTap: showDetailSheet,
                                onTap: () => {},
                                child: Text(
                                  "Detail",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: light,
                                      fontSize: 9),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      profileImage: "images/monyet.jpg",
                    ),
                    CustomCardProfile(
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Peh potret",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: semibold,
                                    fontSize: 12),
                              ),
                              SizedBox(height: 5),
                              StatusBadge(status: OrderStatus.complete)
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                // onTap: showDetailSheet,
                                onTap: () => {},
                                child: Text(
                                  "Detail",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: light,
                                      fontSize: 9),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      profileImage: "images/monyet.jpg",
                    ),
                    CustomCardProfile(
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Peh potret",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: semibold,
                                    fontSize: 12),
                              ),
                              SizedBox(height: 5),
                              StatusBadge(status: OrderStatus.complete)
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                // onTap: showDetailSheet,
                                onTap: () => {},
                                child: Text(
                                  "Detail",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: light,
                                      fontSize: 9),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      profileImage: "images/monyet.jpg",
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
