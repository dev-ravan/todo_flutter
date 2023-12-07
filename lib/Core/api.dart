import 'package:todo_app/Res/strings.dart';
import 'package:todo_app/Utils/exports.dart';
import 'dart:developer';

/// Contains common methods required for client side APIs [GET, POST, PUT,PATCH,DELETE].
/// Pass the [url] from endpoints using [Endpoints] class.
/// Every method has an optional parameter [requireAuth] default [true].
/// Set [requireAuth] to [false] if [authToken] is Empty.
class API {
  // ! [ GET REQUEST ]

  getRequest({required String url, bool requireAuth = true}) async {
    final Map<String, String> requestHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'user-agent': AppConfig.version,
      'Authorization': 'Bearer $authTokenProvider'
    };

    if (requireAuth) {
      if ((authTokenProvider ?? '').isEmpty) {
        return Failure(errorResponse: FailureMessage.authTokenEmpty, code: 404);
      }
    }

    if (AppConfig.logHttp) {
      log(
        'REQUEST TO : $url',
        name: LogLabel.httpGet,
      );
      log('requireAuth : $requireAuth', name: LogLabel.httpGet);
    }

    try {
      final response = await get(Uri.parse(url), headers: requestHeaders);
      log('RESPONSE : ${response.body}', name: LogLabel.httpGet);
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: "No Internet");
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: "Invalid Format");
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: "Unknown Error");
    }
  }

  // ! [ POST Request ]

  postRequest({
    required String url,
    Map<String, dynamic>? body,
    bool requireAuth = true,
  }) async {
    // Headers
    final Map<String, String> requestHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'user-agent': AppConfig.version,
      'Authorization': 'Bearer $authTokenProvider'
    };

    // Check auth require or not
    if (requireAuth) {
      if ((authTokenProvider ?? '').isEmpty) {
        return Failure(errorResponse: FailureMessage.authTokenEmpty, code: 404);
      }
    }

    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpPost);
      log('REQUIRE AUTH : $requireAuth', name: LogLabel.httpPost);
      log('BODY : $body', name: LogLabel.httpPost);
    }

    try {
      final response = await post(
        Uri.parse(url),
        headers: requestHeaders,
        body: jsonEncode(body),
      );
      log('RESPONSE : ${response.body}', name: LogLabel.httpPost);
      if (200 == response.statusCode) {
        return response.body;
      }
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: "No Internet");
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: "Invalid Format");
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: "Unknown Error");
    }
  }

  // ! [ PATCH REQUEST ]

  patchRequest(
      {required String url, dynamic body, bool requireAuth = true}) async {
    // Headers
    final Map<String, String> requestHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'user-agent': AppConfig.version,
      'Authorization': 'Bearer $authTokenProvider'
    };

    // Check auth require or not
    if (requireAuth) {
      if ((authTokenProvider ?? '').isEmpty) {
        return Failure(errorResponse: FailureMessage.authTokenEmpty, code: 404);
      }
    }

    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpPatch);
      log('REQUIRE AUTH : $requireAuth', name: LogLabel.httpPatch);
      log('BODY : $body', name: LogLabel.httpPatch);
    }

    try {
      final response = await patch(
        Uri.parse(url),
        headers: requestHeaders,
        body: jsonEncode(body),
      );

      log('RESPONSE : ${response.body}', name: LogLabel.httpPatch);

      if (200 == response.statusCode) {
        return response.body;
      }
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: "No Internet");
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: "Invalid Format");
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: "Unknown Error");
    }
  }

  // ! [ PUT REQUEST ]

  putRequest(
      {required String url, dynamic body, bool requireAuth = true}) async {
    // Headers
    final Map<String, String> requestHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'user-agent': AppConfig.version,
      'Authorization': 'Bearer $authTokenProvider'
    };

    // Check auth require or not
    if (requireAuth) {
      if ((authTokenProvider ?? '').isEmpty) {
        return Failure(errorResponse: FailureMessage.authTokenEmpty, code: 404);
      }
    }

    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpPut);
      log('REQUIRE AUTH : $requireAuth', name: LogLabel.httpPut);
      log('BODY : $body', name: LogLabel.httpPut);
    }

    try {
      final response = await put(
        Uri.parse(url),
        headers: requestHeaders,
        body: jsonEncode(body),
      );

      log('RESPONSE : ${response.body}', name: LogLabel.httpPut);

      if (200 == response.statusCode) {
        return response.body;
      }
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: "No Internet");
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: "Invalid Format");
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: "Unknown Error");
    }
  }

  // ! [ DELETE REQUEST ]

  deleteRequest(
      {required String url, dynamic body, bool requireAuth = true}) async {
    final Map<String, String> requestHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'user-agent': AppConfig.version,
      'Authorization': 'Bearer $authTokenProvider'
    };

    if (requireAuth) {
      if ((authTokenProvider ?? '').isEmpty) {
        return Failure(errorResponse: FailureMessage.authTokenEmpty, code: 404);
      }
    }

    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpDelete);
      log('requireAuth : $requireAuth', name: LogLabel.httpDelete);
      log('BODY : $body', name: LogLabel.httpDelete);
    }
    try {
      final response = await delete(
        Uri.parse(url),
        headers: requestHeaders,
        body: jsonEncode(body),
      );

      log('RESPONSE : ${response.body}', name: LogLabel.httpPatch);

      if (200 == response.statusCode) {
        return response.body;
      }
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: "No Internet");
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: "Invalid Format");
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: "Unknown Error");
    }
  }
}
