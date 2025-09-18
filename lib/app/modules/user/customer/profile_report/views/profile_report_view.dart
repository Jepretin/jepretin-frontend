import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_report_controller.dart';

class ProfileReportView extends GetView<ProfileReportController> {
  const ProfileReportView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileReportView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileReportView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
