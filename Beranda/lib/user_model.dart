// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String comments;
  String name;
  String email;

  UserModel({
    required this.comments,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    comments: json["comments"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "comments": comments,
    "name": name,
    "email": email,
  };


}
