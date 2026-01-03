// ignore_for_file: use_function_type_syntax_for_parameters

// class BaseResponse<T> {
//   BaseResponse({
//     this.data,
//     this.msg,
//   });

//   T? data;
//   String? msg;

//   factory BaseResponse.fromJson(Map<String, dynamic> json, converter(jsonData)) => BaseResponse(
//         data: json["data"] == null ? null : converter(json["data"]),
//         msg: json["message"],
//       );

//   get status => null;

//   Map<String, dynamic> toJson(Function() toJsonConverter) => {
//         "data": data == null ? null : toJsonConverter(),
//         "msg": msg,
//       };
// }

class BaseResponse<T> {
  BaseResponse({
    this.data,
    this.msg,
  });

  T? data;
  String? msg;

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic jsonData) converter,
  ) {
    return BaseResponse(
      data: json["data"] == null ? null : converter(json["data"]),
      msg: json["message"] ?? json["msg"] ?? json["status"],
    );
  }

  Map<String, dynamic> toJson(Function() toJsonConverter) => {
        "data": data == null ? null : toJsonConverter(),
        "msg": msg,
      };
}

class BaseListModel<T> {
  int? code;
  String? message;
  List<T>? data;

  BaseListModel({this.code, this.message, this.data});

  factory BaseListModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return BaseListModel(
      code: json['code'],
      message: json['message'],
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => fromJsonT(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ApiResponse<T> {
  final int code;
  final String message;
  final T? data; // ✅ ubah jadi T, bukan List<T>

  ApiResponse({
    required this.code,
    required this.message,
    this.data,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    return ApiResponse<T>(
      code: json['code'] ?? 0,
      message: json['message'] ?? json['msg'] ?? json['status'] ?? '',
      data: json['data'] == null ? null : fromJsonT(json['data']),
    );
  }

  Map<String, dynamic> toJson(dynamic Function(T) toJsonT) => {
        'code': code,
        'message': message,
        'data': data == null ? null : toJsonT(data as T),
      };

  bool get isSuccess => code == 200;
}

class ExceptionResponse {
  ExceptionResponse({
    this.message,
    this.statusCode,
    this.path,
    this.errors,
  });

  final String? message;
  final int? statusCode;
  final String? path;
  final List<String>? errors;

  factory ExceptionResponse.fromJson(Map<String, dynamic> json) =>
      ExceptionResponse(
        path: json["path"],
        message: json["message"] ?? json["msg"],
        statusCode: json["status_code"] ?? json["status"] ?? json["code"],
        errors: json["errors"] != null
            ? List<String>.from(json["errors"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "message": message,
        "status_code": statusCode,
        "errors": errors,
      };
}