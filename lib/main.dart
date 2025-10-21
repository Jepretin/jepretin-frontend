import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jepretin/app/data/core/helper/token_manager.dart';
import 'package:jepretin/app/modules/main/controllers/main_controller.dart';
import 'app/routes/app_pages.dart';
import 'package:jepretin/app/themes/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await TokenManager.init();

  // Load file .env
  await dotenv.load(fileName: ".env");
  // await dotenv.load(fileName: "config/.env");

  final isProvider = await TokenManager.isProvider();
  final isAdmin = await TokenManager.isAdmin();

  String initialRoute;

  if (isProvider) {
    initialRoute = 'mainp';
  } if (isAdmin) {
    initialRoute = '';
  } else {
    initialRoute = 'main';
  }

  runApp(
    SafeArea(
      child: GetMaterialApp(
        title: "Jepretin",
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        getPages: AppPages.routes,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, //background global
        ),
      ),
    ),
  );
}
