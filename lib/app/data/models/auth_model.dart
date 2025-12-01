import 'package:jepretin/app/data/models/user_model.dart';

class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      email: json["email"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

// class LoginResponse {
//   final int? code;
//   final String? message;
//   final LoginData? data;

//   LoginResponse({
//     this.code,
//     this.message,
//     this.data,
//   });

//   factory LoginResponse.fromJson(Map<String, dynamic> json) {
//     return LoginResponse(
//       code: json['code'],
//       message: json['message'],
//       data: json['data'] != null ? LoginData.fromJson(json['data']) : null,
//     );
//   }
// }

class LoginResponse {
  final String? token;
  final UserModel? user;

  LoginResponse({
    this.token,
    this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'] ?? "",
      // user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
      user: UserModel.fromJson(json["user"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user?.toJson(),
      };
}

class LoginData {
  final String? token;
  final UserModel? user;

  LoginData({
    this.token,
    this.user,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      token: json['token'],
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user?.toJson(),
      };
}

class RegisterRequest {
  final String name;
  final String email;
  final String password;
  final String phone;

  RegisterRequest(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone});

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      name: json["name"],
      email: json["email"],
      password: json["password"],
      phone: json["phone"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
      };
}

class RegisterResponse {
  final int? code;
  final String? message;
  final RegisterData? data;

  RegisterResponse({
    this.code,
    this.message,
    this.data,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      code: json["code"],
      message: json["message"],
      data: json["data"] != null ? RegisterData.fromJson(json["data"]) : null,
    );
  }
}

class RegisterData {
  final String? otpCode;
  final UserModel? user;

  RegisterData({
    this.otpCode,
    this.user,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) {
    return RegisterData(
      otpCode: json["otpCode"],
      user: json["user"] != null ? UserModel.fromJson(json["user"]) : null,
    );
  }
}

class VerifyOtpRequest {
  final String email;
  final String otpCode;

  VerifyOtpRequest({required this.email, required this.otpCode});

  Map<String, dynamic> toJson() => {
        "email": email,
        "otpCode": otpCode,
      };
}

class OtpResponse {
  final String otpCode;
  final UserModel user;

  OtpResponse({
    required this.otpCode,
    required this.user,
  });

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(
      otpCode: json["otpCode"] ?? "",
      user: UserModel.fromJson(json["user"]),
    );
  }

  toJson() {}
}
