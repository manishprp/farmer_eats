// To parse this JSON data, do
//
//     final signupSuccessModel = signupSuccessModelFromJson(jsonString);

import 'dart:convert';

SignupSuccessModel signupSuccessModelFromJson(Map<String, dynamic> str) =>
    SignupSuccessModel.fromJson(str);

String signupSuccessModelToJson(SignupSuccessModel data) =>
    json.encode(data.toJson());

class SignupSuccessModel {
  bool? success;
  String? message;
  String? token;

  SignupSuccessModel({
    this.success,
    this.message,
    this.token,
  });

  factory SignupSuccessModel.fromJson(Map<String, dynamic> json) =>
      SignupSuccessModel(
        success: json["success"],
        message: json["message"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "token": token,
      };
}
