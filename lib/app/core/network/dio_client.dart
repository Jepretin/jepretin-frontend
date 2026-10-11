import 'package:dio/dio.dart';
import 'dart:developer' as dev;
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Jangan lupa import HeaderClient yang sudah kamu buat sebelumnya
import 'header_client.dart'; 

class DioClient {
  // PERBAIKAN 1: Penulisan Singleton Dart yang aman dan anti-crash
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;
  DioClient._internal();
  static DioClient get instance => _instance;

  Dio initInstance() {
    final Dio dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: dotenv.env['BASE_URL'] ?? '',
        connectTimeout: const Duration(seconds: 60),
        validateStatus: (status) {
          // Hanya status 200-299 yang masuk blok "try", sisanya dilempar ke "catch"
          return status != null && status >= 200 && status < 300;
        },
      ),
    );

    dio.interceptors.add(
      ApiInterceptor(requestRetrier: DioConnectivityRequestRetrier(dio: dio)),
    );

    return dio;
  }
}

class ApiInterceptor extends InterceptorsWrapper {
  final DioConnectivityRequestRetrier requestRetrier;

  ApiInterceptor({required this.requestRetrier});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.contentType = Headers.jsonContentType;

    if (options.path.startsWith('/')) {
      options.path = options.path.substring(1);
    }

    // --- 👇 UBAH BAGIAN INI 👇 ---
    // Gunakan await karena setHeaderBearer() sekarang adalah Future
    final customHeaders = await HeaderClient.setHeaderBearer();
    options.headers.addAll(customHeaders);
    // -----------------------------

    dev.log('======================\n');
    dev.log('========onRequest=====\n');
    dev.log(options.path, name: 'path');
    dev.log(options.headers.toString(), name: 'headers');
    dev.log(options.queryParameters.toString(), name: 'queryParameters');
    dev.log(options.data.toString(), name: 'data');
    dev.log('======================\n');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    dev.log(response.toString(),
        name: "${response.requestOptions.path} - ${response.statusCode ?? 0}");

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    dev.log(err.toString(), name: err.requestOptions.path);

    // TODO: Nanti bisa di-uncomment kalau mau integrasi Firebase Crashlytics
    // await FirebaseCrashlytics.instance.recordError(
    //   err.message,
    //   StackTrace.current,
    //   reason: "Server Error Detected2 ${err.requestOptions.path}",
    // );

    // TODO: Nanti bisa di-uncomment untuk fitur Auto-Retry jika tidak ada internet
    // if (_shouldRetry(err)) {
    //   try {
    //     requestRetrier.scheduleRequestRetry(err.requestOptions);
    //   } catch (e) {
    //     print(e);
    //   }
    // }

    super.onError(err, handler);
  }

  // bool _shouldRetry(DioException err) {
  //   return err.type == DioExceptionType.unknown &&
  //       err.error != null; // Sesuaikan untuk mendeteksi SocketException
  // }
}

class DioConnectivityRequestRetrier {
  final Dio dio;

  DioConnectivityRequestRetrier({required this.dio});

  // Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
  //   final result = await Get.toNamed(NoInternetPage.routeName);
  //   final responseCompleter = Completer<Response>();

  //   if (result != null) {
  //     responseCompleter.complete(dio.fetch(requestOptions));
  //   }

  //   return responseCompleter.future;
  // }
}