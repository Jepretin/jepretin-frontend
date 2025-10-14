import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart'; 
import 'app/routes/app_pages.dart';
import 'package:jepretin/app/themes/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load file .env
  await dotenv.load(fileName: "config/.env");
  await GetStorage.init();

  runApp(
    SafeArea(
      child: GetMaterialApp(
        title: "Application",
        initialRoute: Routes.MAIN,
        getPages: AppPages.routes,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, //background global
        ),
      ),
    ),
  );
}
