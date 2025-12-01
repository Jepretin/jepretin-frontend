import 'package:dartz/dartz.dart';
import 'package:jepretin/app/data/models/provider_model.dart';
import 'package:jepretin/app/data/services/api_endpoint.dart';
import 'package:jepretin/app/data/services/api_service.dart';
import 'package:jepretin/app/data/services/base_model.dart';
import 'package:jepretin/app/data/services/dio_service.dart';
import 'package:jepretin/app/data/services/header_client.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:dio/dio.dart' as dio;

class ProviderService {
  /// ✅ GET Provider (ambil data provider user saat ini)
  static Future<Either<ExceptionResponse, BaseResponse<RegisProviderResponse>>>
      getProvider() async {
    return await ApiClient.instance.request(
      HttpMethod.get,
      path: ApiEndpoint.getProvider,
      dio: DioClient.instance.initInstance(),
      headers: await HeaderClient.setHeaderBearer(),
      responseConverter: (body) {
        return BaseResponse<RegisProviderResponse>.fromJson(
          body,
          (json) => RegisProviderResponse.fromJson(json),
        );
      },
    );
  }

  static Future<Either<ExceptionResponse, BaseResponse<RegisProviderResponse>>>
      registerProvider(RegisProviderRequest request) async {
    return await ApiClient.instance.request(
      HttpMethod.post,
      path: ApiEndpoint.postProvider,
      dio: DioClient.instance.initInstance(),
      headers: await HeaderClient.setHeaderBearer(),
      body: request.toJson(),
      responseConverter: (body) {
        return BaseResponse<RegisProviderResponse>.fromJson(
          body,
          (json) => RegisProviderResponse.fromJson(json),
        );
      },
    );
  }

  static Future<
          Either<ExceptionResponse, BaseResponse<List<PortfolioResponse>>>>
      uploadPortfolio(PortfolioRequest request) async {
    // 1️⃣ Ambil header Bearer token
    final headers = await HeaderClient.setHeaderBearerMultipart();
    print("🔑 [UPLOAD PORTFOLIO] Header dikirim: $headers");

    // 2️⃣ Siapkan FormData
    final formData = dio.FormData();

    // Tambahkan file media (bisa lebih dari 1)
    for (final path in request.media) {
      formData.files.add(MapEntry(
        'media',
        await dio.MultipartFile.fromFile(
          path,
          filename: path.split('/').last,
        ),
      ));
    }

    // Tambahkan field lain
    formData.fields.addAll([
      MapEntry('mediaType', request.mediaType ?? 'image'),
      MapEntry('description', request.description ?? ''),
    ]);

    // Debug log biar tahu apa yang dikirim
    print("📦 [UPLOAD PORTFOLIO] Payload:");
    print("- media: ${request.media.length} file");
    print("- mediaType: ${request.mediaType}");
    print("- description: ${request.description}");

    // 3️⃣ Kirim request
    return await ApiClient.instance.request(
      HttpMethod.post,
      path: ApiEndpoint.postPortofolioProvider,
      dio: DioClient.instance.initInstance(),
      headers: headers,
      body: formData,
      responseConverter: (body) {
        return BaseResponse<List<PortfolioResponse>>.fromJson(
          body,
          (json) => (json as List)
              .map((item) => PortfolioResponse.fromJson(item))
              .toList(),
        );
      },
    );
  }

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

  static Future<Either<ExceptionResponse, ApiResponse<List<CoverageModel>>>>
      getCoverageByDistrict(String districtId) async {
    return _fetchTerritory<CoverageModel>(
      endpoint: ApiEndpoint.getCoverage(districtId: districtId),
      fromJsonT: CoverageModel.fromJson,
    );
  }
}
