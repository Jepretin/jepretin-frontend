class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? role;
  final String? phone;

  UserModel({this.id, this.name, this.email, this.role, this.phone});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"]?.toString() ?? "",
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      role: json["role"] ?? "",
      phone: json["phone"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "role": role,
        "phone": phone,
      };
}

class UserProfileModel {
  final String? id;
  final String? name;
  final String? email;
  final String? role;
  final String? phone;
  final String? avatar;
  final bool? isActive;
  final bool? isVerified;
  final String? createdAt;
  final String? updatedAt;

  UserProfileModel({
    this.id,
    this.name,
    this.email,
    this.role,
    this.phone,
    this.avatar,
    this.isActive,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      phone: json['phone'],
      avatar: json['avatar'],
      isActive: json['isActive'],
      isVerified: json['isVerified'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "role": role,
        "phone": phone,
        "avatar": avatar,
        "isActive": isActive,
        "isVerified": isVerified,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

// Berfungsi untuk mengambil data Nama Lengkap dan Nomor
class NamaPhoneModel {
  final String? id;
  final String? name;
  final String? phone;

  NamaPhoneModel({
    this.id,
    this.name,
    this.phone,
  });

  factory NamaPhoneModel.fromJson(Map<String, dynamic> json) {
    return NamaPhoneModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
      };
}
