import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'models/base_model.dart'; // Sesuaikan path ini

enum HttpMethod { get, post, patch, put, delete }

class ApiClient {
  static ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;
  ApiClient._internal();
  static ApiClient get instance => _instance = ApiClient._internal();

  bool isSuccess(Response? response) {
    final code = response?.statusCode ?? 0;
    return code >= 200 && code < 300;
  }

  Future<Either<ExceptionResponse, T>> request<T>(
    HttpMethod httpMethod, {
    required String
    path, // PERBAIKAN 3: Hapus tanda tanya agar path wajib diisi
    required Dio dio,
    Map<String, dynamic>? headers,
    var body,
    required T Function(dynamic body) responseConverter,
  }) async {
    try {
      Response? response;

      switch (httpMethod) {
        case HttpMethod.get:
          // PERBAIKAN 3: Hapus garis miring "/" sebelum $path
          response = await dio.get(
            path,
            options: Options(
              receiveDataWhenStatusError: true,
              headers: headers,
            ),
          );
          break;
        case HttpMethod.post:
          response = await dio.post(
            path,
            data: body,
            options: Options(
              receiveDataWhenStatusError: true,
              headers: headers,
            ),
          );
          break;
        case HttpMethod.put:
          response = await dio.put(
            path,
            data: body,
            options: Options(
              receiveDataWhenStatusError: true,
              headers: headers,
            ),
          );
          break;
        case HttpMethod.patch:
          response = await dio.patch(
            path,
            data: body,
            options: Options(
              receiveDataWhenStatusError: true,
              headers: headers,
            ),
          );
          break;
        case HttpMethod.delete:
          response = await dio.delete(
            path,
            options: Options(
              receiveDataWhenStatusError: true,
              headers: headers,
            ),
          );
          break;
      }

      // PERBAIKAN 2: Hanya parse ExceptionResponse jika benar-benar gagal
      if (isSuccess(response)) {
        return right(responseConverter(response.data));
      } else {
        ExceptionResponse errorResponse = ExceptionResponse.fromJson(
          response.data ?? {},
        );

        return left(
          ExceptionResponse(
            message: errorResponse.message ?? 'Unknown Error Occurred',
            path: response.realUri.toString(),
            statusCode: response.statusCode ?? 0,
          ),
        );
      }
      // if (isSuccess(response)) {
      //   return right(responseConverter(response?.data));
      // } else {
      //   // Ini berjaga-jaga jika Dio diatur validateStatus: (status) => true
      //   ExceptionResponse errorResponse = ExceptionResponse.fromJson(response?.data ?? {});
      //   return left(ExceptionResponse(
      //     message: errorResponse.message ?? 'Unknown Error Occurred',
      //     path: response?.realUri.toString() ?? path,
      //     statusCode: response?.statusCode ?? 0,
      //   ));
      // }
    } on DioException catch (e) {
      ExceptionResponse test;

      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          test = ExceptionResponse(
            message: 'Connection Timeout. Silakan coba lagi.',
            statusCode: e.response?.statusCode,
            path: e.requestOptions.path,
          );
          break;

        case DioExceptionType.badResponse:
          // PERBAIKAN 1: Tangkap pesan asli dari Backend saat error 400/500!
          try {
            // Coba ambil format error dari JSON Backend
            test = ExceptionResponse.fromJson(e.response?.data);

            // Timpa status code dan path dengan data asli dari Dio jika di JSON backend kosong
            test = ExceptionResponse(
              message: test.message ?? 'Terjadi kesalahan pada server',
              statusCode: e.response?.statusCode,
              path: e.requestOptions.path,
              errors: test.errors,
            );
          } catch (_) {
            // Kalau backend mengirim respon aneh (misal HTML bukannya JSON), fallback ke default
            test = ExceptionResponse(
              message: e.message,
              statusCode: e.response?.statusCode,
              path: e.requestOptions.path,
            );
          }
          break;

        case DioExceptionType.connectionError:
          test = ExceptionResponse(
            message: 'Tidak ada koneksi internet',
            statusCode: 1000,
            path: e.requestOptions.path,
          );
          break;

        default:
          test = ExceptionResponse(
            message: e.message ?? 'Terjadi kesalahan yang tidak diketahui',
            statusCode: e.response?.statusCode ?? 0,
            path: e.requestOptions.path,
          );
          break;
      }

      return left(test);
    } catch (e) {
      // PERBAIKAN TAMBAHAN: Tangkap error di luar jaringan (misal error saat parsing UI/JSON)
      return left(
        ExceptionResponse(
          message: 'Parsing Error: $e',
          statusCode: -1,
          path: path,
        ),
      );
    }
  }
}
