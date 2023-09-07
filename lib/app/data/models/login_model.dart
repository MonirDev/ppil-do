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

  LoginModel({
    this.token,
    this.expiration,
    this.userName,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        expiration: json["expiration"] == null
            ? null
            : DateTime.parse(json["expiration"]),
        userName: json["userName"],
      );
}
