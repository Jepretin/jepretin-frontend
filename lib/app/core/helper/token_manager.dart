import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jepretin/app/data/models/user_model.dart';

class TokenManager {
  static const _storage = FlutterSecureStorage();

  static const _keyToken = 'auth_token';
  static const _keyUser = 'user_data'; // ✅ ini kunci untuk user model JSON
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
  static Future<void> saveUser(UserModel user) async {
    final jsonString = jsonEncode(user.toJson());
    await _storage.write(key: _keyUser, value: jsonString);
  }

  static Future<UserModel?> getUser() async {
    final jsonString = await _storage.read(key: _keyUser);
    if (jsonString == null) return null;
    return UserModel.fromJson(jsonDecode(jsonString));
  }

  // Simpan Id User
  static Future<void> saveUserId(String id) async {
    await _storage.write(key: 'user_id', value: id);
  }

  // Ambil Id User
  static Future<String?> getUserId() async {
    return await _storage.read(key: 'user_id');
  }

  static Future<String?> getUserRole() async {
    final user = await getUser();
    return user?.role;
  }

  static Future<bool> isProvider() async {
    final role = await getUserRole();
    return role == "PROVIDER";
  }

  static Future<bool> isCustomer() async {
    final role = await getUserRole();
    return role == "CUSTOMER";
  }

  static Future<bool> isAdmin() async {
    final role = await getUserRole();
    return role == "ADMIN";
  }

  // Address Section

  // Simpan Address
  static Future<void> saveUserAddresses(List<dynamic> addresses) async {
    final jsonString = jsonEncode(addresses);
    await _storage.write(key: _keyAddress, value: jsonString);
  }

  // Ambil Address
  static Future<List<dynamic>> getUserAddresses() async {
    final jsonString = await _storage.read(key: _keyAddress);
    if (jsonString == null) return [];
    return jsonDecode(jsonString);
  }

  static Future<void> saveAddressId(String id) async {
    await _storage.write(key: _keyAddressId, value: id);
  }

  static Future<String?> getAddressesId() async {
    return await _storage.read(key: 'address_id');
  }

  static Future<void> clearAddressId() async {
    await _storage.delete(key: _keyAddressId);
  }

  // ========================
  // 🚀 INIT SECTION
  // ========================
  static Future<void> init() async {
    await _storage.readAll(); // hanya untuk memastikan storage siap
  }
}


// class TokenManager {
//   // ✅ Gunakan const untuk efisiensi, tapi jangan final const bersamaan
//   static const FlutterSecureStorage _storage = FlutterSecureStorage();

//   static const _keyToken = 'auth_token';
//   static const _keyRefreshToken = 'refresh_token';
//   static const _keyRole = 'user_data';

//   static Future<void> init() async {
//     // Tidak perlu isi apa pun sekarang.
//     // Disiapkan aja untuk future use (misal migrasi token, clear data, dll).
//   }

//   // Simpan token
//   static Future<void> saveToken(String token) async {
//     await _storage.write(key: _keyToken, value: token);
//   }

//   // Ambil token
//   static Future<String?> getToken() async {
//     return await _storage.read(key: _keyToken);
//   }

//   // Simpan refresh token (optional)
//   static Future<void> saveRefreshToken(String refreshToken) async {
//     await _storage.write(key: _keyRefreshToken, value: refreshToken);
//   }

//   // Ambil refresh token (optional)
//   static Future<String?> getRefreshToken() async {
//     return await _storage.read(key: _keyRefreshToken);
//   }

//   // Simpan role user
//   static Future<void> saveRole(String role) async {
//     await _storage.write(key: _keyRole, value: role);
//   }

//   // Ambil role user
//   static Future<String?> getRole() async {
//     return await _storage.read(key: _keyRole);
//   }

  // // Simpan Id User
  // static Future<void> saveUserId(String id) async {
  //   await _storage.write(key: 'user_id', value: id);
  // }

  // // Ambil Id User
  // static Future<String?> getUserId() async {
  //   return await _storage.read(key: 'user_id');
  // }

//   // Hapus semua data auth (logout)
//   static Future<void> clearToken() async {
//     await _storage.delete(key: _keyToken);
//     await _storage.delete(key: _keyRefreshToken);
//     await _storage.delete(key: _keyRole);
//   }

//   // Cek apakah token ada
//   static Future<bool> hasToken() async {
//     final token = await _storage.read(key: _keyToken);
//     return token != null && token.isNotEmpty;
//   }

//   // Cek login status
//   static Future<bool> isLoggedIn() async {
//     final token = await getToken();
//     return token != null && token.isNotEmpty;
//   }

//   // USER
//   static Future<void> saveUser(UserModel user) async {
//     final jsonString = jsonEncode(user.toJson());
//     await _storage.write(key: _keyUser, value: jsonString);
//   }

//   static Future<UserModel?> getUser() async {
//     final jsonString = await _storage.read(key: _keyUser);
//     if (jsonString == null) return null;
//     return UserModel.fromJson(jsonDecode(jsonString));
//   }

//   static Future<String?> getUserRole() async {
//     final user = await getUser();
//     return user?.role;
//   }

//   static Future<bool> isProvider() async {
//     final role = await getUserRole();
//     return role == "PROVIDER";
//   }

//   static Future<bool> isCustomer() async {
//     final role = await getUserRole();
//     return role == "CUSTOMER";
//   }

//   static Future<bool> isAdmin() async {
//     final role = await getUserRole();
//     return role == "ADMIN";
//   }
// }

// class SecureStorageService {
//   static const _storage = FlutterSecureStorage();

//   static Future<void> write(String key, String value) async {
//     await _storage.write(key: key, value: value);
//   }

//   static Future<String?> read(String key) async {
//     return await _storage.read(key: key);
//   }

//   static Future<void> delete(String key) async {
//     await _storage.delete(key: key);
//   }

//   static Future<void> clear() async {
//     await _storage.deleteAll();
//   }
// }
