import 'package:dio/dio.dart';
import 'dart:developer' as dev;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient {
  static DioClient? _instance;
  factory DioClient() => _instance!;

  DioClient._internal();

  static DioClient get instance => _instance = DioClient._internal();

  Dio initInstance() {
    final Dio dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: dotenv.env['BASE_URL'] ?? '',
        connectTimeout: const Duration(seconds: 60),
        validateStatus: (status) {
          return status != null && status >= 200 && status < 300;
        },

        // validateStatus: (status) => (status != null && (status < 403 || status == 412)),
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

    // await FirebaseCrashlytics.instance.recordError(
    //   err.message,
    //   StackTrace.current,
    //   reason: "Server Error Detected2 ${err.requestOptions.path}",
    // );

    // if (_shouldRetry(err)) {
    //   try {
    //     requestRetrier.scheduleRequestRetry(err.requestOptions);
    //   } catch (e) {
    //     print(e);
    //   }
    // }

    // if (err.response!.data['message'] == 'Token is Invalid') {
    //   showSessionExpiredBottomSheet();
    // } else if (err.response!.statusCode == 500) {
    //   showSystemMaintenanceBottomSheet();
    // }

    super.onError(err, handler);
  }

  // bool _shouldRetry(DioError err) {
  //   return err.type == DioErrorType.other &&
  //       err.error != null &&
  //       err.error is SocketException;
  // }

  // Future showSessionExpiredBottomSheet() async {}

  // Future showSystemMaintenanceBottomSheet() async {}
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
