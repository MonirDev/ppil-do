// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

class LoginModel {
  final String? token;
  final DateTime? expiration;
  final String? userName;
  final String? companyName;
  final int? companyId;

  LoginModel({
    this.token,
    this.expiration,
    this.userName,
    this.companyName,
    this.companyId,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        expiration: json["expiration"] == null
            ? null
            : DateTime.parse(json["expiration"]),
        userName: json["userName"],
        companyName: json["companyName"],
        companyId: json["companyId"],
      );
}
