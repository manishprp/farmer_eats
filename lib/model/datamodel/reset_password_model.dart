// To parse this JSON data, do
//
//     final resetPasswordModel = resetPasswordModelFromJson(jsonString);

import 'dart:convert';

ResetPasswordModel resetPasswordModelFromJson(String str) =>
    ResetPasswordModel.fromJson(json.decode(str));

String resetPasswordModelToJson(ResetPasswordModel data) =>
    json.encode(data.toJson());

class ResetPasswordModel {
  String? token;
  String? password;
  String? cpassword;

  ResetPasswordModel({
    this.token,
    this.password,
    this.cpassword,
  });

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      ResetPasswordModel(
        token: json["token"],
        password: json["password"],
        cpassword: json["cpassword"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "password": password,
        "cpassword": cpassword,
      };
}
