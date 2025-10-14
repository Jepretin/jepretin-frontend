import 'package:dartz/dartz.dart';
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
      headers: HeaderClient.setHeaderBearer(),
      responseConverter: (body) {
        return BaseResponse<UserProfileModel>.fromJson(
          body,
          (json) => UserProfileModel.fromJson(json), // jangan body['data'] lagi
        );
      },
    );
  }
}
