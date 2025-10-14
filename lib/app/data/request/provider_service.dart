import 'package:dartz/dartz.dart';
import 'package:jepretin/app/data/models/provider_model.dart';
import 'package:jepretin/app/data/services/api_endpoint.dart';
import 'package:jepretin/app/data/services/api_service.dart';
import 'package:jepretin/app/data/services/base_model.dart';
import 'package:jepretin/app/data/services/dio_service.dart';
import 'package:jepretin/app/data/services/header_client.dart';

class ProviderService {
  /// ✅ GET Provider (ambil data provider user saat ini)
  static Future<Either<ExceptionResponse, BaseResponse<RegisProviderResponse>>>
      getProvider() async {
    return await ApiClient.instance.request(
      HttpMethod.get,
      path: ApiEndpoint.getProvider,
      dio: DioClient.instance.initInstance(),
      headers: HeaderClient.setHeaderBearer(),
      responseConverter: (body) {
        return BaseResponse<RegisProviderResponse>.fromJson(
          body,
          (json) => RegisProviderResponse.fromJson(json),
        );
      },
    );
  }

  /// ✅ POST Provider (daftar sebagai provider baru)
  static Future<Either<ExceptionResponse, BaseResponse<RegisProviderResponse>>>
      registerProvider(RegisProviderRequest request) async {
    return await ApiClient.instance.request(
      HttpMethod.post,
      path: ApiEndpoint.postProvider,
      dio: DioClient.instance.initInstance(),
      headers: HeaderClient.setHeaderBearer(),
      body: request.toJson(),
      responseConverter: (body) {
        return BaseResponse<RegisProviderResponse>.fromJson(
          body,
          (json) => RegisProviderResponse.fromJson(json),
        );
      },
    );
  }
}
