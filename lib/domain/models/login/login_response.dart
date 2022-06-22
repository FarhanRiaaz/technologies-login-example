import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.statusCode,
    this.message,
    this.data,
  });

  int? statusCode;
  String? message;
  Data? data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        statusCode: json["statusCode"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.user,
    this.token,
  });

  User? user;
  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
      };
}

class User {
  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.emailVerifiedAt,
    this.phone,
    this.phoneVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.roleId,
    this.status,
    this.language,
    this.role,
    this.clients,
  });

  int? id;
  String? name;
  String? username;
  String? email;
  dynamic emailVerifiedAt;
  String? phone;
  dynamic phoneVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? roleId;
  String? status;
  String? language;
  Role? role;
  List<int>? clients;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        phone: json["phone"],
        phoneVerifiedAt: json["phone_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        roleId: json["role_id"],
        status: json["status"],
        language: json["language"],
        role: Role.fromJson(json["role"]),
        clients: List<int>.from(json["clients"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phone": phone,
        "phone_verified_at": phoneVerifiedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "role_id": roleId,
        "status": status,
        "language": language,
        "role": role?.toJson(),
        "clients":
            clients != null ? List<dynamic>.from(clients!.map((x) => x)) : null,
      };
}

class Role {
  Role({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
    this.privilege,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? description;
  String? privilege;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        description: json["description"],
        privilege: json["privilege"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "name": name,
        "description": description,
        "privilege": privilege,
      };
}
