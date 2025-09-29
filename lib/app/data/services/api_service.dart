import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'base_model.dart';

enum HttpMethod { get, post, patch, put, delete }

class ApiClient {
  static ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;
  ApiClient._internal();
  static ApiClient get instance => _instance = ApiClient._internal();

  bool isSuccess(Response? response) => response?.statusCode == 200;

  Future<Either<ExceptionResponse, T>> request<T>(HttpMethod httpMethod,
      {required String? path,
      required Dio dio,
      Map<String, dynamic>? headers,
      var body,
      required T Function(dynamic body) responseConverter}) async {
    try {
      Response? response;

      switch (httpMethod) {
        //http request with request method GET
        case HttpMethod.get:
          response = await dio.get("/$path",
              options: Options(receiveDataWhenStatusError: true, headers: headers));
          break;

        // http request with request method POST and dynamic body payload
        case HttpMethod.post:
          response = await dio.post("/$path",
              data: body,
              options: Options(
                receiveDataWhenStatusError: true,
                headers: headers,
              ));
          break;

        // http request with request method PUT and dynamic body payload
        case HttpMethod.put:
          response = await dio.put("/$path",
              data: body,
              options: Options(
                headers: headers,
              ));
          break;

        // http request with request method PATCH and dynamic body payload
        case HttpMethod.patch:
          response = await dio.patch("/$path", data: body, options: Options(headers: headers));
          break;

        // http request with request method DELETE and dynamic body payload
        case HttpMethod.delete:
          response = await dio.delete("/$path", options: Options(headers: headers));
          break;

        default:
          break;
      }
      ExceptionResponse test = ExceptionResponse.fromJson(response?.data);
      return isSuccess(response)
          ? right(responseConverter(response?.data))
          : left(ExceptionResponse(
              message: test.message,
              path: response?.realUri.toString() ?? '',
              statusCode: response?.statusCode ?? 0,
            ));
    } on DioException catch (e) {
      ExceptionResponse test = ExceptionResponse(
          message: e.message, statusCode: e.response?.statusCode, path: e.requestOptions.path);
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          test = ExceptionResponse(
              message: 'Connection Timeout',
              statusCode: e.response?.statusCode,
              path: e.requestOptions.path);
          break;
        case DioExceptionType.badCertificate:
        case DioExceptionType.badResponse:
        case DioExceptionType.cancel:
          test = ExceptionResponse(
              message: e.message, statusCode: e.response?.statusCode, path: e.requestOptions.path);
          break;
        case DioExceptionType.unknown:
          test = ExceptionResponse(
              message: e.error.toString(), statusCode: 0, path: e.requestOptions.path);
          break;
        case DioExceptionType.connectionError:
          test = ExceptionResponse(
              message: 'No Internet', statusCode: 1000, path: e.requestOptions.path);
          break;
      }

      // ignore: avoid_print
      print(e.response?.statusCode);
      return left(test);
    }
  }
}
