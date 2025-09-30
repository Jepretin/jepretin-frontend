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

class ExceptionResponse {
  ExceptionResponse({
    this.message,
    this.statusCode,
    this.path,
  });

  final String? message;
  final int? statusCode;
  final String? path;

  // factory ExceptionResponse.fromJson(Map<String, dynamic> json) =>
  //     ExceptionResponse(
  //       path: json["path"],
  //       message: json["message"],
  //       statusCode: json["status_code"],
  //     );

  factory ExceptionResponse.fromJson(Map<String, dynamic> json) =>
      ExceptionResponse(
        path: json["path"],
        message: json["message"] ?? json["msg"],
        statusCode: json["status_code"] ?? json["status"] ?? json["code"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "message": message,
        "status_code": statusCode,
      };
}
