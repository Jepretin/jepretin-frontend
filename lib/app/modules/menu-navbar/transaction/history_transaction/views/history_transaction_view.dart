import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/history_transaction_controller.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/shared/customCardContent.dart';
import 'package:jepretin/app/themes/themes.dart';

class HistoryTransactionView extends GetView<HistoryTransactionController> {
  const HistoryTransactionView({super.key});
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
                            Text("Peh potret",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: semibold,
                                    fontSize: 12)),
                            StatusBadge(status: OrderStatus.complete)
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Rp. 200.000",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: semibold,
                                    fontSize: 9)),
                            GestureDetector(
                              child: Text("Detail",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: light,
                                      fontSize: 9)),
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
                            Text("Peh potret",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: semibold,
                                    fontSize: 12)),
                            StatusBadge(status: OrderStatus.pending)
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Rp. 200.000",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: semibold,
                                    fontSize: 9)),
                            GestureDetector(
                              child: Text("Detail",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: light,
                                      fontSize: 9)),
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
                            Text("Peh potret",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: semibold,
                                    fontSize: 12)),
                            StatusBadge(status: OrderStatus.cancel)
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Rp. 200.000",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: semibold,
                                    fontSize: 9)),
                            GestureDetector(
                              child: Text("Detail",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: light,
                                      fontSize: 9)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    profileImage: "images/monyet.jpg"),

              ],
            ),
          ),
        ));
  }
}
