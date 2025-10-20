class RoleModel {
  final String id;
  final String name;

  RoleModel({required this.id, required this.name});

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
    id: json['id'].toString(),
    name: json['name'] ?? '',
  );

  Map<String, dynamic> toJson() => {'id': id, 'name': name};

  @override
  String toString() => 'RoleModel(id: $id, name: $name)';
}

class RoleResponse {
  final int code;
  final String message;
  final List<RoleModel> data;

  RoleResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory RoleResponse.fromJson(Map<String, dynamic> json) => RoleResponse(
        code: json['code'] ?? 0,
        message: json['message'] ?? '',
        data: (json['data'] as List<dynamic>)
            .map((item) => RoleModel.fromJson(item))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() => "RoleResponse(code: $code, data: $data)";
}
