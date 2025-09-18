import 'package:jepretin/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    // Container(
    // decoration: const BoxDecoration(color: Colors.white),
    SafeArea(
      child: GetMaterialApp(
        title: "Application",
        initialRoute: Routes.MAIN,
        getPages: AppPages.routes,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, // ⬅️ background global
        ),
      ),
    ),
    // ),
  );
}
