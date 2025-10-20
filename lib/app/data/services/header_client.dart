// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jepretin/app/data/core/helper/token_manager.dart';

class HeaderClient {
  // static const token = FlutterSecureStorage();

  // Header dengan Bearer Token
  static Future<Map<String, String>> setHeaderBearer() async {
    final token = await TokenManager.getToken();

    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      if (token != null && token.isNotEmpty) "Authorization": "Bearer $token",
    };
  }

  // Header tanpa Token (misalnya untuk login/register)
  static Map<String, String> basic() {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  }

  static Map<String, dynamic> setHeaderMultipart() {
    Map<String, dynamic> header = {
      "Content-Type": 'multipart/form-data',
      "Accept": 'application/json',
    };
    return header;
  }
}
