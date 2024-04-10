// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  String? fullName;
  String? email;
  String? phone;
  String? password;
  String? role;
  String? businessName;
  String? informalName;
  String? address;
  String? city;
  String? state;
  int? zipCode;
  String? registrationProof;
  BusinessHours? businessHours;
  String? deviceToken;
  String? type;
  String? socialId;

  RegisterModel({
    this.fullName,
    this.email,
    this.phone,
    this.password,
    this.role,
    this.businessName,
    this.informalName,
    this.address,
    this.city,
    this.state,
    this.zipCode,
    this.registrationProof,
    this.businessHours,
    this.deviceToken,
    this.type,
    this.socialId,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        fullName: json["full_name"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        role: json["role"],
        businessName: json["business_name"],
        informalName: json["informal_name"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zip_code"],
        registrationProof: json["registration_proof"],
        businessHours: json["business_hours"] == null
            ? null
            : BusinessHours.fromJson(json["business_hours"]),
        deviceToken: json["device_token"],
        type: json["type"],
        socialId: json["social_id"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "email": email,
        "phone": phone,
        "password": password,
        "role": role,
        "business_name": businessName,
        "informal_name": informalName,
        "address": address,
        "city": city,
        "state": state,
        "zip_code": zipCode,
        "registration_proof": registrationProof,
        "business_hours": businessHours?.toJson(),
        "device_token": deviceToken,
        "type": type,
        "social_id": socialId,
      };
}

class BusinessHours {
  List<String>? mon;
  List<String>? tue;
  List<String>? wed;
  List<String>? thu;
  List<String>? fri;
  List<String>? sat;
  List<String>? sun;

  BusinessHours({
    this.mon,
    this.tue,
    this.wed,
    this.thu,
    this.fri,
    this.sat,
    this.sun,
  });

  factory BusinessHours.fromJson(Map<String, dynamic> json) => BusinessHours(
        mon: json["mon"] == null
            ? []
            : List<String>.from(json["mon"]!.map((x) => x)),
        tue: json["tue"] == null
            ? []
            : List<String>.from(json["tue"]!.map((x) => x)),
        wed: json["wed"] == null
            ? []
            : List<String>.from(json["wed"]!.map((x) => x)),
        thu: json["thu"] == null
            ? []
            : List<String>.from(json["thu"]!.map((x) => x)),
        fri: json["fri"] == null
            ? []
            : List<String>.from(json["fri"]!.map((x) => x)),
        sat: json["sat"] == null
            ? []
            : List<String>.from(json["sat"]!.map((x) => x)),
        sun: json["sun"] == null
            ? []
            : List<String>.from(json["sun"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "mon": mon == null ? [] : List<dynamic>.from(mon!.map((x) => x)),
        "tue": tue == null ? [] : List<dynamic>.from(tue!.map((x) => x)),
        "wed": wed == null ? [] : List<dynamic>.from(wed!.map((x) => x)),
        "thu": thu == null ? [] : List<dynamic>.from(thu!.map((x) => x)),
        "fri": fri == null ? [] : List<dynamic>.from(fri!.map((x) => x)),
        "sat": sat == null ? [] : List<dynamic>.from(sat!.map((x) => x)),
        "sun": sun == null ? [] : List<dynamic>.from(sun!.map((x) => x)),
      };
}
