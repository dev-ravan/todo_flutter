/// Contains all the strings used across the app.
/// Avoid hard coding strings.
/// All the strings must be added in this file.

class AppStrings {
  static const appName = "To Do App";
}

class FailureMessage {
  static const getRequestMessage = "GET REQUEST FAILED";
  static const postRequestMessage = "POST REQUEST FAILED";
  static const putRequestMessage = "PUT REQUEST FAILED";
  static const deleteRequestMessage = "DELETE REQUEST FAILED";
  static const jsonParsingFailed = "FAILED TO PARSE JSON RESPONSE";
  static const authTokenEmpty = "AUTH TOKEN EMPTY";
  static const failedToParseJson = "Failed to Parse JSON Data";
}

class SnackBarMessages {
  static const productLoadSuccess = "Products Loaded Successfully";
  static const productLoadFailed = "Failed To Load Products";
  static const patientLoadSuccess = "Patients Loaded Successfully";
  static const patientLoadFailed = "Failed To Load Patients";
  static const loginSuccess = "Login Successfully";
  static const loginFailure = "Failed to Login";
}

class LogLabel {
  static const patient = "PATIENT";
  static const login = "LOGIN";
  static const product = "PRODUCT";
  static const auth = "AUTH";
  static const httpGet = "HTTP/GET";
  static const httpPost = "HTTP/POST";
  static const httpPut = "HTTP/PUT";
  static const httpPatch = "HTTP/PATCH";
  static const httpDelete = "HTTP/DELETE";
  static const sharedPrefs = "SHARED_PREFERENCES";
}
