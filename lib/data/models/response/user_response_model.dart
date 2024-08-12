import 'dart:convert';

import 'package:sttal/data/models/response/auth_response_model.dart';


class UserResponseModel {
  final String? message;
  final Prajurit? prajurit;

  UserResponseModel({
    this.message,
    this.prajurit,
  });

  factory UserResponseModel.fromJson(String str) =>
      UserResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserResponseModel.fromMap(Map<String, dynamic> json) =>
      UserResponseModel(
        message: json["message"],
        prajurit: json["prajurit"] == null ? null : Prajurit.fromMap(json["prajurit"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "prajurit": prajurit?.toMap(),
      };
}
