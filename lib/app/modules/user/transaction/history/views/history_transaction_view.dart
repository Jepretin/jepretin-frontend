import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/history_transaction_controller.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/shared/customCardContent.dart';
import 'package:jepretin/app/themes/themes.dart';

class HistoryTransactionView extends GetView<HistoryTransactionController> {
  const HistoryTransactionView({super.key});
  void showDetailSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Detail",
                style: TextStyle(
                    color: primaryColor, fontSize: 15, fontWeight: bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Bundle :",
                style: TextStyle(
                    color: primaryColor.withOpacity(0.7),
                    fontWeight: semibold,
                    fontSize: 12),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: primaryColor.withOpacity(0.3)))),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      "-",
                      style: TextStyle(
                          color: primaryColor.withOpacity(0.7),
                          fontWeight: medium,
                          fontSize: 12),
                    ),
                    const Spacer(),
                    Text(
                      "Rp 0",
                      style: TextStyle(
                          color: primaryColor.withOpacity(0.7),
                          fontWeight: medium,
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Topping :",
                style: TextStyle(
                    color: primaryColor.withOpacity(0.7),
                    fontWeight: semibold,
                    fontSize: 12),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: primaryColor.withOpacity(0.3)))),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text("Unlimited Photo"),
                        const Spacer(),
                        const Text("Rp 100.000"),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Text("Drone"),
                        const Spacer(),
                        const Text("Rp 250.000"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Biaya Tambahan :",
                style: TextStyle(
                    color: primaryColor.withOpacity(0.7),
                    fontWeight: semibold,
                    fontSize: 12),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: primaryColor.withOpacity(0.3)))),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Text("Biaya Transfer"),
                    const Spacer(),
                    const Text("Rp 2.500"),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                        color: primaryColor, fontWeight: bold, fontSize: 15),
                  ),
                  const Spacer(),
                  Text(
                    "Rp.200.000",
                    style: TextStyle(
                        color: primaryColor, fontWeight: bold, fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Transaksi'),
        centerTitle: true,
      ),
      body: GetBuilder(
        init: HistoryTransactionController(),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
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
                          StatusBadge(status: OrderStatus.complete)
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Rp. 200.000",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: semibold,
                                fontSize: 9),
                          ),
                          GestureDetector(
                            onTap: showDetailSheet,
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
                  profileImage: "images/monyet.jpg"),
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
                          StatusBadge(status: OrderStatus.pending)
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Rp. 200.000",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: semibold,
                                fontSize: 9),
                          ),
                          GestureDetector(
                            onTap: showDetailSheet,
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
                  profileImage: "images/monyet.jpg"),
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
                          StatusBadge(status: OrderStatus.cancel)
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Rp. 200.000",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: semibold,
                                fontSize: 9),
                          ),
                          GestureDetector(
                            onTap: showDetailSheet,
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
                  profileImage: "images/monyet.jpg"),
            ],
          ),
        ),
      ),
    );
  }
}
