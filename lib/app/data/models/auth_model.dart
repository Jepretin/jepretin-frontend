class UserModel {
  final String id;
  final String email;
  final String role;

  UserModel({required this.id, required this.email, required this.role});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      email: json["email"],
      role: json["role"],
    );
  }
}

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

class VerifyOTPResponse {
  final String? email;
  final String? token;

  VerifyOTPResponse({this.email, this.token});

  factory VerifyOTPResponse.fromJson(Map<String, dynamic> json) {
    return VerifyOTPResponse(
      email: json["email"],
      token: json["token"],
    );
  }

  toJson() {}
}

class OTPResponse {
  final String token;
  final UserModel user;

  OTPResponse({required this.token, required this.user});

  factory OTPResponse.fromJson(Map<String, dynamic> json) {
    return OTPResponse(
      token: json["token"],
      user: UserModel.fromJson(json["user"]),
    );
  }
}

class forgotPasswordRequest {
  final String? email;


  forgotPasswordRequest({this.email});

  factory forgotPasswordRequest.fromJson(Map<String, dynamic> json) {
    return forgotPasswordRequest(
      email: json["email"],
    );
  }

  toJson() {}
}

