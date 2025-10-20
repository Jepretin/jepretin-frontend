import 'package:dartz/dartz.dart';
import 'package:jepretin/app/data/models/role_model.dart';
import 'package:jepretin/app/data/models/user_model.dart';
import 'package:jepretin/app/data/services/api_endpoint.dart';
import 'package:jepretin/app/data/services/api_service.dart';
import 'package:jepretin/app/data/services/base_model.dart';
import 'package:jepretin/app/data/services/dio_service.dart';
import 'package:jepretin/app/data/services/header_client.dart';

class UserService {
  static Future<Either<ExceptionResponse, BaseResponse<UserProfileModel>>>
      getProfile() async {
    return await ApiClient.instance.request(
      HttpMethod.get,
      path: ApiEndpoint.getUser,
      dio: DioClient.instance.initInstance(),
      headers: await HeaderClient.setHeaderBearer(),
      responseConverter: (body) {
        final nestedData = body['data'];
        final userJson = nestedData is Map<String, dynamic>
            ? (nestedData['data'] ?? nestedData)
            : {};
        return BaseResponse<UserProfileModel>.fromJson(
          body,
          (json) => UserProfileModel.fromJson(userJson),
        );
      },
    );
  }

  static Future<Either<ExceptionResponse, RoleResponse>> getRole() async {
    return await ApiClient.instance.request(
      HttpMethod.get,
      path: ApiEndpoint.getRole,
      dio: DioClient.instance.initInstance(),
      headers: await HeaderClient.setHeaderBearer(),
      responseConverter: (body) {
        return RoleResponse.fromJson(body);
      },
    );
  }

  // static Future<Either<ExceptionResponse, BaseResponse<RoleModel>>>
  //     getRole() async {
  //   return await ApiClient.instance.request(
  //     HttpMethod.get,
  //     path: ApiEndpoint.getRole,
  //     dio: DioClient.instance.initInstance(),
  //     headers: await HeaderClient.setHeaderBearer(),
  //     responseConverter: (body) {
  //       return BaseResponse<RoleModel>.fromJson(
  //         body,
  //         (json) => RoleModel.fromJson(json), // jangan body['data'] lagi
  //       );
  //     },
  //   );
  // }
}
