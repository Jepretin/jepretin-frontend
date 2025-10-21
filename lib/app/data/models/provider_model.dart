class RegisProviderModel {
  final String id;
  final String experience;
  final String status;
  final List<String> roles;
  final DateTime createdAt;
  final DateTime updatedAt;

  RegisProviderModel({
    required this.id,
    required this.experience,
    required this.status,
    required this.roles,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RegisProviderModel.fromJson(Map<String, dynamic> json) =>
      RegisProviderModel(
        id: json["id"] ?? "",
        experience: json["experience"] ?? "",
        status: json["status"] ?? "",
        roles: List<String>.from(json["roles"] ?? []),
        createdAt:
            DateTime.parse(json["createdAt"] ?? DateTime.now().toString()),
        updatedAt:
            DateTime.parse(json["updatedAt"] ?? DateTime.now().toString()),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "experience": experience,
        "status": status,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class RegisProviderRequest {
  final String experience;
  final List<String> roles;

  RegisProviderRequest({
    required this.experience,
    required this.roles,
  });

  Map<String, dynamic> toJson() {
    return {
      "experience": experience,
      "roles": roles,
    };
  }

  factory RegisProviderRequest.fromJson(Map<String, dynamic> json) {
    return RegisProviderRequest(
      experience: json["experience"] ?? '',
      roles: List<String>.from(json["roles"] ?? []),
    );
  }
}

class RegisProviderResponse {
  final String? message;
  final RegisProviderModel? data;

  RegisProviderResponse({
    this.message,
    this.data,
  });

  factory RegisProviderResponse.fromJson(Map<String, dynamic> json) =>
      RegisProviderResponse(
        message: json["message"],
        data: json["data"] != null
            ? RegisProviderModel.fromJson(json["data"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}

class PortfolioRequest {
  final List<String> media; // path lokal file
  final String mediaType;   // wajib
  final String? description;

  PortfolioRequest({
    required this.media,
    required this.mediaType,
    this.description,
  });
}

class PortfolioResponse {
  final String id;
  final String providerId;
  final String providerName;
  final String mediaUrl;
  final String mediaType;
  final String? description;
  final String createdAt;

  PortfolioResponse({
    required this.id,
    required this.providerId,
    required this.providerName,
    required this.mediaUrl,
    required this.mediaType,
    this.description,
    required this.createdAt,
  });

  factory PortfolioResponse.fromJson(Map<String, dynamic> json) {
    return PortfolioResponse(
      id: json['id'] ?? '',
      providerId: json['providerId'] ?? '',
      providerName: json['providerName'] ?? '',
      mediaUrl: json['mediaUrl'] ?? '',
      mediaType: json['mediaType'] ?? '',
      description: json['description'],
      createdAt: json['createdAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'providerId': providerId,
        'providerName': providerName,
        'mediaUrl': mediaUrl,
        'mediaType': mediaType,
        if (description != null) 'description': description,
        'createdAt': createdAt,
      };
}

