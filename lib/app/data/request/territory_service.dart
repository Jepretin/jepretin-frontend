import 'package:dartz/dartz.dart';
import 'package:jepretin/app/data/models/territory_model.dart';
import 'package:jepretin/app/data/services/api_endpoint.dart';
import 'package:jepretin/app/data/services/api_service.dart';
import 'package:jepretin/app/data/services/base_model.dart';
import 'package:jepretin/app/data/services/dio_service.dart';
import 'package:jepretin/app/data/services/header_client.dart';

class TerritoryService {
  static Future<Either<ExceptionResponse, ApiResponse<List<T>>>>
      _fetchTerritory<T>({
    required String endpoint,
    required T Function(Map<String, dynamic>) fromJsonT,
  }) async {
    return await ApiClient.instance.request(
      HttpMethod.get,
      path: endpoint,
      dio: DioClient.instance.initInstance(),
      headers: await HeaderClient.setHeaderBearer(),
      responseConverter: (body) {
        return ApiResponse<List<T>>.fromJson(
          body,
          (data) => (data as List)
              .map((item) => fromJsonT(item as Map<String, dynamic>))
              .toList(),
        );
      },
    );
  }

  static Future<Either<ExceptionResponse, ApiResponse<List<ProvinceModel>>>>
      getProvinces() async {
    return _fetchTerritory<ProvinceModel>(
      endpoint: ApiEndpoint.getProvinces,
      fromJsonT: ProvinceModel.fromJson,
    );
  }

  static Future<Either<ExceptionResponse, ApiResponse<List<RegencyModel>>>>
      getRegencies(String provinceId) async {
    return _fetchTerritory<RegencyModel>(
      endpoint: ApiEndpoint.getRegencies(provinceId: provinceId),
      fromJsonT: RegencyModel.fromJson,
    );
  }

  static Future<Either<ExceptionResponse, ApiResponse<List<DistrictModel>>>>
      getDistricts(String regencyId) async {
    return _fetchTerritory<DistrictModel>(
      endpoint: ApiEndpoint.getDistricts(regencyId: regencyId),
      fromJsonT: DistrictModel.fromJson,
    );
  }

  static Future<Either<ExceptionResponse, ApiResponse<List<VillageModel>>>>
      getVillages(String districtId) async {
    return _fetchTerritory<VillageModel>(
      endpoint: ApiEndpoint.getVillages(districtId: districtId),
      fromJsonT: VillageModel.fromJson,
    );
  }

  static Future<Either<ExceptionResponse, ApiResponse<AddressModel>>>
      addAddress(
    AddressRequest request,
  ) async {
    try {
      final headers = await HeaderClient.setHeaderBearer();

      final body = request.toJson();
      print("📦 [ADD ADDRESS] Body dikirim: $body");

      return await ApiClient.instance.request(
        HttpMethod.post,
        path: ApiEndpoint.postAddress, // pastikan endpoint-nya sesuai BE kamu
        dio: DioClient.instance.initInstance(),
        headers: headers,
        body: body,
        responseConverter: (data) {
          return ApiResponse<AddressModel>.fromJson(
            data,
            (json) => AddressModel.fromJson(json),
          );
        },
      );
    } catch (e) {
      print("❌ [ADD ADDRESS] Error: $e");
      return Left(ExceptionResponse(message: e.toString()));
    }
  }

  static Future<Either<ExceptionResponse, ApiResponse<List<AddressModel>>>>
      getAllAddress() async {
    try {
      final headers = await HeaderClient.setHeaderBearer();

      return await ApiClient.instance.request(
        HttpMethod.get,
        path: ApiEndpoint.getAllAddress,
        dio: DioClient.instance.initInstance(),
        headers: headers,
        responseConverter: (body) {
          // body = seluruh JSON response dari BE
          return ApiResponse<List<AddressModel>>.fromJson(
            body,
            (json) {
              // json = body['data']
              final list = json['data'] as List? ?? [];

              return list
                  .map<AddressModel>((item) => AddressModel.fromJson(item))
                  .toList();
            },
          );
        },
      );
    } catch (e) {
      print("❌ [GET ALL ADDRESS] Error: $e");
      return Left(ExceptionResponse(message: e.toString()));
    }
  }

  static Future<Either<ExceptionResponse, ApiResponse<List<dynamic>>>>
      getAddressById(String addressId) async {
    try {
      final headers = await HeaderClient.setHeaderBearer();

      return await ApiClient.instance.request(
        HttpMethod.get,
        path: ApiEndpoint.getAddressID(addressId: addressId),
        dio: DioClient.instance.initInstance(),
        headers: headers,
        responseConverter: (body) {
          return ApiResponse<List<dynamic>>.fromJson(body, (json) => json);
        },
      );
    } catch (e) {
      print("❌ [GET ADDRESS BY ID] Error: $e");
      return Left(ExceptionResponse(message: e.toString()));
    }
  }

  static Future<Either<ExceptionResponse, ApiResponse<AddressModel>>>
      updateAddress(String addressId, PutAddressRequest request) async {
    try {
      final headers = await HeaderClient.setHeaderBearer();

      return await ApiClient.instance.request(
        HttpMethod.put,
        path: ApiEndpoint.putAddress(
            addressId: addressId), // pastikan endpoint-nya sesuai BE kamu
        dio: DioClient.instance.initInstance(),
        headers: headers,
        responseConverter: (body) {
          return ApiResponse<AddressModel>.fromJson(
            body,
            (json) => AddressModel.fromJson(json),
          );
        },
      );
    } catch (e) {
      print("❌ [ADD ADDRESS] Error: $e");
      return Left(ExceptionResponse(message: e.toString()));
    }
  }
}
