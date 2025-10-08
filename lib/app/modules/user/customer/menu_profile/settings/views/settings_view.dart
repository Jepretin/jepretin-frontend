import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jepretin/app/themes/themes.dart';
import '../controllers/settings_controller.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/shared/customCardContent.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        centerTitle: true,
      ),
      body: GetBuilder(
        init: SettingsController(),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            children: [
              InputWithLabel(
                  label: 'Keamanan',
                  input: CustomCardSingle(
                      child: Row(
                    children: [
                      Icon(Icons.key),
                      SizedBox(width: 25),
                      Text('Ubah Kata Sandi'),
                      Spacer(),
                      Icon(Icons.chevron_right)
                    ],
                  ))),
              InputWithLabel(
                  label: 'Bahasa Sistem',
                  input: CustomCardSingle(
                      child: Row(
                    children: [
                      Icon(Icons.language_outlined),
                      SizedBox(width: 25),
                      Text('Bahasa'),
                      Spacer(),
                      Icon(Icons.chevron_right)
                    ],
                  ))),
              InputWithLabel(
                  label: 'Tema',
                  input: CustomCardSingle(
                      child: Row(
                    children: [
                      Icon(Icons.wb_sunny_rounded),
                      SizedBox(width: 25),
                      Text('Mode Gelap'),
                      Spacer(),
                      SizedBox(
                        height: 32,
                        width: 32,
                        child: Switch(
                          value: true,
                          onChanged: (_) {},
                          activeColor: primaryColor,
                        ),
                      ),
                    ],
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}
