import 'package:dartz/dartz.dart';
import 'package:jepretin/app/data/models/auth_model.dart';
import 'package:jepretin/app/data/services/api_endpoint.dart';
import 'package:jepretin/app/data/services/api_service.dart';
import 'package:jepretin/app/data/services/base_model.dart';
import 'package:jepretin/app/data/services/dio_service.dart';
import 'package:jepretin/app/data/services/header_client.dart';

class AuthService {
  //   // contoh debug {
  //   // print("➡️ Request Body: ${request.toJson()}");
  //   // print("➡️ Endpoint: ${ApiEndpoint.register}");
  //   // print("➡️ BaseURL (RegisterView): ${dotenv.env['BASE_URL']}");
  //   // }

  static Future<Either<ExceptionResponse, BaseResponse<LoginResponse>>>
      loginUser(LoginRequest request) async {
    return await ApiClient.instance.request(
      HttpMethod.post,
      path: ApiEndpoint.login, // misalnya "auth/login"
      dio: DioClient.instance.initInstance(),
      headers: HeaderClient.basic(),
      body: request.toJson(),
      responseConverter: (body) {
        print("🐛 BODY di responseConverter: $body");
        return BaseResponse<LoginResponse>.fromJson(
          body,
          (json) => LoginResponse.fromJson(json),
        );
      },
      // (body) => BaseResponse<LoginResponse>.fromJson(
      //   body,
      //   (body) => LoginResponse.fromJson(body),
      // ),
    );
  }

  static Future<Either<ExceptionResponse, RegisterResponse>> registerUser(
      RegisterRequest request) async {
    return await ApiClient.instance.request(
      HttpMethod.post,
      path: ApiEndpoint.register,
      dio: DioClient.instance.initInstance(),
      headers: HeaderClient.basic(),
      body: request.toJson(),
      responseConverter: (body) => RegisterResponse.fromJson(body),
    );
  }

  static Future<Either<ExceptionResponse, BaseResponse<OtpResponse>>>
      verifyOtpUser(VerifyOtpRequest request) async {
    return await ApiClient.instance.request(
      HttpMethod.post,
      path: ApiEndpoint.verifyOtp, // misal: "auth/verify-otp"
      dio: DioClient.instance.initInstance(),
      headers: HeaderClient.basic(),
      body: request.toJson(),
      responseConverter: (body) => BaseResponse<OtpResponse>.fromJson(
        body,
        (body) => OtpResponse.fromJson(body),
      ),
    );
  }

  // static Future<void> logout() async {
  //   final box = GetStorage();

  //   // Hapus token yang disimpan
  //   await box.remove("token");

  //   await ApiClient.instance.request(
  //     HttpMethod.post,
  //     path: ApiEndpoint.logout,
  //     dio: DioClient.instance.initInstance(),
  //     headers: HeaderClient.setHeaderBearer(),
  //     responseConverter: (body) {},
  //   );
  // }
}
