import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// Pastikan file UserModel ini nanti dibuat ya!
// import 'package:jepretin/app/data/models/user_model.dart'; 

class TokenManager {
  static const _storage = FlutterSecureStorage();

  // --- DEFINISI KEYS (Biar nggak salah ketik) ---
  static const _keyToken = 'auth_token';
  // static const _keyUser = 'user_data'; 
  static const _keyUserId = 'user_id'; // Tambahan key untuk ID
  static const _keyAddress = "user_addresses";
  static const _keyAddressId = "address_id";

  // ========================
  // 🔑 TOKEN SECTION
  // ========================
  static Future<void> saveToken(String token) async {
    await _storage.write(key: _keyToken, value: token);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: _keyToken);
  }

  static Future<void> clearToken() async {
    await _storage.deleteAll();
  }

  static Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  // ========================
  // 👤 USER SECTION
  // ========================
  // static Future<void> saveUser(UserModel user) async {
  //   final jsonString = jsonEncode(user.toJson());
  //   await _storage.write(key: _keyUser, value: jsonString);
  // }

  // static Future<UserModel?> getUser() async {
  //   final jsonString = await _storage.read(key: _keyUser);
  //   if (jsonString == null) return null;
  //   return UserModel.fromJson(jsonDecode(jsonString));
  // }

  // Simpan Id User (Sudah diperbaiki menggunakan const key)
  static Future<void> saveUserId(String id) async {
    await _storage.write(key: _keyUserId, value: id);
  }

  // Ambil Id User (Sudah diperbaiki menggunakan const key)
  static Future<String?> getUserId() async {
    return await _storage.read(key: _keyUserId);
  }

  // --- ROLE HELPERS ---
  // static Future<String?> getUserRole() async {
  //   final user = await getUser();
  //   return user?.role;
  // }

  // static Future<bool> isProvider() async {
  //   final role = await getUserRole();
  //   return role == "PROVIDER";
  // }

  // static Future<bool> isCustomer() async {
  //   final role = await getUserRole();
  //   return role == "CUSTOMER";
  // }

  // static Future<bool> isAdmin() async {
  //   final role = await getUserRole();
  //   return role == "ADMIN";
  // }

  // ========================
  // 📍 ADDRESS SECTION
  // ========================
  static Future<void> saveUserAddresses(List<dynamic> addresses) async {
    final jsonString = jsonEncode(addresses);
    await _storage.write(key: _keyAddress, value: jsonString);
  }

  static Future<List<dynamic>> getUserAddresses() async {
    final jsonString = await _storage.read(key: _keyAddress);
    if (jsonString == null) return [];
    return jsonDecode(jsonString);
  }

  static Future<void> saveAddressId(String id) async {
    await _storage.write(key: _keyAddressId, value: id);
  }

  // Sudah diperbaiki menggunakan const key
  static Future<String?> getAddressesId() async {
    return await _storage.read(key: _keyAddressId);
  }

  static Future<void> clearAddressId() async {
    await _storage.delete(key: _keyAddressId);
  }

  // ========================
  // 🚀 INIT SECTION
  // ========================
  static Future<void> init() async {
    await _storage.readAll(); // Memastikan storage siap
  }
}