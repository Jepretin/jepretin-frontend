import 'package:get_storage/get_storage.dart';

class HeaderClient {
  // static Map<String, dynamic> setHeaderBearer() {
  //   Map<String, dynamic> header = {
  //     "Content-Type": 'application/json',
  //     "Accept": 'application/json',
  //   };
  //   return header;
  // }
  static Map<String, String> setHeaderBearer() {
    final box = GetStorage();
    final token = box.read("token") ?? "";
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      if (token.isNotEmpty) "Authorization": "Bearer $token",
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
