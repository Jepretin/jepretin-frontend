import 'package:dartz/dartz.dart';
import 'package:jepretin/app/data/models/auth_model.dart';
import 'package:jepretin/app/data/services/api_endpoint.dart';
import 'package:jepretin/app/data/services/api_service.dart';
import 'package:jepretin/app/data/services/base_model.dart';
import 'package:jepretin/app/data/services/dio_service.dart';
import 'package:jepretin/app/data/services/header_client.dart';

class AuthService {
  static Future<Either<ExceptionResponse, BaseResponse<LoginRequest>>>
      loginUser(LoginRequest request) async {
    return await ApiClient.instance.request(
      HttpMethod.post,
      path: ApiEndpoint.login, // misalnya "auth/login"
      dio: DioClient.instance.initInstance(),
      headers: HeaderClient.setHeaderBearer(),
      body:request.toJson(),
      responseConverter: (body) => BaseResponse<LoginRequest>.fromJson(
        body,
        (body) => LoginRequest.fromJson(body),
      ),
    );
  }

  static Future<Either<ExceptionResponse, BaseResponse<VerifyOTPResponse>>>
      registerUser(RegisterRequest request) async {
    // yang ini jangan kau hapus {
    // print("➡️ Request Body: ${request.toJson()}");
    // print("➡️ Endpoint: ${ApiEndpoint.register}");
    // print("➡️ BaseURL (RegisterView): ${dotenv.env['BASE_URL']}");
    // }
    return await ApiClient.instance.request(
      HttpMethod.post,
      path: ApiEndpoint.register, // misalnya "auth/register"
      dio: DioClient.instance.initInstance(),
      headers: HeaderClient.setHeaderBearer(),
      body: request.toJson(),
      responseConverter: (body) => BaseResponse<VerifyOTPResponse>.fromJson(
          body, (body) => VerifyOTPResponse.fromJson(body)),
    );
  }

  static Future<Either<ExceptionResponse, BaseResponse<VerifyOTPResponse>>>
      verifyOtp({required String email, required String otp}) async {
    return await ApiClient.instance.request(
      HttpMethod.post,
      path: ApiEndpoint.verifyOtp, // misalnya "auth/verify-otp"
      dio: DioClient.instance.initInstance(),
      headers: HeaderClient.setHeaderBearer(),
      body: {
        "email": email,
        "otp": otp,
      },
      responseConverter: (body) => BaseResponse<VerifyOTPResponse>.fromJson(
          body, (body) => VerifyOTPResponse.fromJson(body)),
    );
  }
}
