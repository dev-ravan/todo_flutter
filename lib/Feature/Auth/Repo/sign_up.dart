import 'dart:developer';

import '../../../Utils/exports.dart';

class RegisterRepo {
  static Future<RegisterUser> registerUser(
      {required String email, required String password}) async {
    var url = "localhost:3000/registration";

    final response = await post(
      Uri.parse(url),
      body: jsonEncode(<String, String>{"email": email, "password": email}),
    );
    log('RESPONSE : ${response.body}', name: LogLabel.httpPost);
    if (200 == response.statusCode) {
      return registerUserFromJson(response.body);
    }
    return registerUserFromJson(response.body);
  }
}
