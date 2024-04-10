// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? email;
  String? password;
  String? role;
  String? deviceToken;
  String? type;
  String? socialId;

  LoginModel({
    this.email,
    this.password,
    this.role,
    this.deviceToken,
    this.type,
    this.socialId,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        email: json["email"],
        password: json["password"],
        role: json["role"],
        deviceToken: json["device_token"],
        type: json["type"],
        socialId: json["social_id"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "role": role,
        "device_token": deviceToken,
        "type": type,
        "social_id": socialId,
      };
}
