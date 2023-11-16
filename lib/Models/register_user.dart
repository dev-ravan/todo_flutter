// To parse this JSON data, do
//
//     final registerUser = registerUserFromJson(jsonString);

import 'dart:convert';

RegisterUser registerUserFromJson(String str) =>
    RegisterUser.fromJson(json.decode(str));

String registerUserToJson(RegisterUser data) => json.encode(data.toJson());

class RegisterUser {
  String email;
  String password;

  RegisterUser({
    required this.email,
    required this.password,
  });

  RegisterUser copyWith({
    String? email,
    String? password,
  }) =>
      RegisterUser(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  factory RegisterUser.fromJson(Map<String, dynamic> json) => RegisterUser(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
