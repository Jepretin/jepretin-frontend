import 'package:jepretin/app/data/models/user_model.dart';

class ProvinceModel {
  final String id;
  final String name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  ProvinceModel({
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory ProvinceModel.fromJson(Map<String, dynamic> json) {
    return ProvinceModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
      deletedAt: json['deletedAt'] != null
          ? DateTime.tryParse(json['deletedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'deletedAt': deletedAt?.toIso8601String(),
      };
}

// =====================================================
// 🏙 KABUPATEN / KOTA
// =====================================================

class RegencyModel {
  final String id;
  final ProvinceModel? province;
  final String name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  RegencyModel({
    required this.id,
    this.province,
    required this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory RegencyModel.fromJson(Map<String, dynamic> json) => RegencyModel(
        id: json['id'].toString(),
        province: json["province"] != null
            ? ProvinceModel.fromJson(json["province"])
            : null,
        name: json['name'] ?? '',
        createdAt: json['createdAt'] != null
            ? DateTime.tryParse(json['createdAt'])
            : null,
        updatedAt: json['updatedAt'] != null
            ? DateTime.tryParse(json['updatedAt'])
            : null,
        deletedAt: json['deletedAt'] != null
            ? DateTime.tryParse(json['deletedAt'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'province': province,
        'name': name,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'deletedAt': deletedAt?.toIso8601String(),
      };
}

// =====================================================
// 🏘 KECAMATAN
// =====================================================

class DistrictModel {
  final String id;
  final RegencyModel? regency;
  final String name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  DistrictModel({
    required this.id,
    this.regency,
    required this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
        id: json['id'].toString(),
        regency: json["regency"] != null
            ? RegencyModel.fromJson(json["regency"])
            : null,
        name: json['name'] ?? '',
        createdAt: json['createdAt'] != null
            ? DateTime.tryParse(json['createdAt'])
            : null,
        updatedAt: json['updatedAt'] != null
            ? DateTime.tryParse(json['updatedAt'])
            : null,
        deletedAt: json['deletedAt'] != null
            ? DateTime.tryParse(json['deletedAt'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'regency': regency,
        'name': name,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'deletedAt': deletedAt?.toIso8601String(),
      };
}

// =====================================================
// 🏡 DESA / KELURAHAN
// =====================================================

class VillageModel {
  final String id;
  final String name;
  final DistrictModel? district;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  VillageModel({
    required this.id,
    required this.name,
    this.district,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory VillageModel.fromJson(Map<String, dynamic> json) => VillageModel(
        id: json['id'].toString(),
        name: json['name'] ?? '',
        district: json["district"] != null
            ? DistrictModel.fromJson(json["district"])
            : null,
        createdAt: json['createdAt'] != null
            ? DateTime.tryParse(json['createdAt'])
            : null,
        updatedAt: json['updatedAt'] != null
            ? DateTime.tryParse(json['updatedAt'])
            : null,
        deletedAt: json['deletedAt'] != null
            ? DateTime.tryParse(json['deletedAt'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'district': district,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'deletedAt': deletedAt?.toIso8601String(),
      };
}

class AddressModel {
  final String id;
  final UserModel? userModel;
  final String? userId;
  final String addressDetail;
  final bool isPrimary;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final VillageModel? village;

  AddressModel({
    required this.id,
    this.userModel,
    this.userId,
    required this.addressDetail,
    required this.isPrimary,
    this.createdAt,
    this.updatedAt,
    this.village,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json["id"] ?? "",
      userId: json["userId"] ?? "",
      addressDetail: json["addressDetail"] ?? "",
      isPrimary: json["isPrimary"] ?? false,
      createdAt:
          json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null,
      updatedAt:
          json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null,
      village: json["village"] != null
          ? VillageModel.fromJson(json["village"])
          : null,
    );
  }
}

class AddressRequest {
  final String villageId; // diambil dari database (dropdown atau API)
  final String addressDetail; // input dari user
  final bool isPrimary; // otomatis true/false tergantung kondisi

  AddressRequest({
    required this.villageId,
    required this.addressDetail,
    required this.isPrimary,
  });

  Map<String, dynamic> toJson() {
    return {
      "villageId": villageId,
      "addressDetail": addressDetail,
      "isPrimary": isPrimary,
    };
  }
}

class PutAddressRequest {
  final String addressId;
  final String villageId; // diambil dari database (dropdown atau API)
  final String addressDetail; // input dari user
  final bool isPrimary; // otomatis true/false tergantung kondisi

  PutAddressRequest({
    required this.addressId,
    required this.villageId,
    required this.addressDetail,
    required this.isPrimary,
  });

  Map<String, dynamic> toJson() {
    return {
      "addressId": addressId,
      "villageId": villageId,
      "addressDetail": addressDetail,
      "isPrimary": isPrimary,
    };
  }
}

