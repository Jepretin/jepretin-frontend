import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/history_transaction_controller.dart';

class HistoryTransactionView extends GetView<HistoryTransactionController> {
  const HistoryTransactionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HistoryTransactionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HistoryTransactionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
