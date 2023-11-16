import 'package:todo_app/Utils/exports.dart';
import 'dart:developer';

/// Contains common methods required for client side APIs [GET, POST, PUT, DELETE].
/// Pass the [url] from endpoints using [Endpoints] class.
/// Every method has an optional parameter [requireAuth] default [true].
/// Set [requireAuth] to [false] if [authToken] is Empty.
class API {
  // // ! its used for get request

  // FutureEither<Response> getRequest(
  //     {required String url, bool requireAuth = true}) async {
  //   final Map<String, String> requestHeaders = {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'user-agent': AppConfig.version,
  //     'Authorization': 'Bearer $authTokenProvider'
  //   };
  //   if (requireAuth) {
  //     if ((authTokenProvider ?? '').isEmpty) {
  //       return Left(Failure(message: FailureMessage.authTokenEmpty));
  //     }
  //   }
  //   if (AppConfig.logHttp) {
  //     log(
  //       'REQUEST TO : $url',
  //       name: LogLabel.httpGet,
  //     );
  //     log('requireAuth : $requireAuth', name: LogLabel.httpGet);
  //   }
  //   try {
  //     final response = await get(Uri.parse(url), headers: requestHeaders);
  //     log('RESPONSE : ${response.body}', name: LogLabel.httpGet);
  //     return Right(response);
  //   } catch (e, stktrc) {
  //     print(e);
  //     return Left(Failure(
  //         message: FailureMessage.getRequestMessage, stackTrace: stktrc));
  //   }
  // }

  // ! its used for Post request

  Future<Object> postRequest(
      {required String url,
      dynamic body,
      bool requireAuth = true,
      required dynamic model}) async {
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
      log('requireAuth : $requireAuth', name: LogLabel.httpPost);
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
        return Success(code: 200, response: model(response.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: "Invalid Response");
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: "No Internet");
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: "Invalid Format");
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: "Unknown Error");
    }
  }

  // // ! its used for Patch request

  // FutureEither<Response> patchRequest(
  //     {required String url, dynamic body, bool requireAuth = true}) async {
  //   final Map<String, String> requestHeaders = {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'user-agent': AppConfig.version,
  //     'Authorization': 'Bearer $authTokenProvider'
  //   };
  //   if (requireAuth) {
  //     if ((authTokenProvider ?? '').isEmpty) {
  //       return Left(Failure(message: FailureMessage.authTokenEmpty));
  //     }
  //   }
  //   if (AppConfig.logHttp) {
  //     log('REQUEST TO : $url', name: LogLabel.httpPost);
  //     log('requireAuth : $requireAuth', name: LogLabel.httpPost);
  //     log('BODY : $body', name: LogLabel.httpPost);
  //   }
  //   try {
  //     final response = await patch(Uri.parse(url),
  //         body: jsonEncode(body), headers: requestHeaders);
  //     log('RESPONSE : ${response.body}', name: LogLabel.httpPost);
  //     return Right(response);
  //   } catch (e, stktrc) {
  //     print(e);
  //     return Left(Failure(
  //         message: FailureMessage.postRequestMessage, stackTrace: stktrc));
  //   }
  // }

  // // ! its used for put request

  // FutureEither<Response> putRequest(
  //     {required String url, dynamic body, bool requireAuth = true}) async {
  //   final Map<String, String> requestHeaders = {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'user-agent': AppConfig.version,
  //     'Authorization': 'Bearer $authTokenProvider'
  //   };
  //   if (requireAuth) {
  //     if ((authTokenProvider ?? '').isEmpty) {
  //       return Left(Failure(message: FailureMessage.authTokenEmpty));
  //     }
  //   }
  //   if (AppConfig.logHttp) {
  //     log('REQUEST TO : $url', name: LogLabel.httpPut);
  //     log(
  //       'requireAuth : $requireAuth',
  //       name: LogLabel.httpPut,
  //     );
  //     log('BODY : $body', name: LogLabel.httpPut);
  //   }
  //   try {
  //     final response = await put(Uri.parse(url),
  //         body: jsonEncode(body), headers: requestHeaders);
  //     log('RESPONSE : ${response.body}', name: LogLabel.httpPut);
  //     return Right(response);
  //   } catch (e, stktrc) {
  //     return Left(Failure(
  //         message: FailureMessage.putRequestMessage, stackTrace: stktrc));
  //   }
  // }

  // // ! its used for delete request

  // FutureEither<Response> deleteRequest(
  //     {required String url, dynamic body, bool requireAuth = true}) async {
  //   final Map<String, String> requestHeaders = {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'user-agent': AppConfig.version,
  //     'Authorization': 'Bearer $authTokenProvider'
  //   };
  //   if (requireAuth) {
  //     if ((authTokenProvider ?? '').isEmpty) {
  //       return Left(Failure(message: FailureMessage.authTokenEmpty));
  //     }
  //   }
  //   if (AppConfig.logHttp) {
  //     log('REQUEST TO : $url', name: LogLabel.httpDelete);
  //     log('requireAuth : $requireAuth', name: LogLabel.httpDelete);
  //     log('BODY : $body', name: LogLabel.httpDelete);
  //   }
  //   try {
  //     final response = await put(Uri.parse(url),
  //         body: jsonEncode(body), headers: requestHeaders);
  //     log('RESPONSE : ${response.body}', name: LogLabel.httpDelete);
  //     return Right(response);
  //   } catch (e, stktrc) {
  //     return Left(Failure(
  //         message: FailureMessage.deleteRequestMessage, stackTrace: stktrc));
  //   }
  // }
}
