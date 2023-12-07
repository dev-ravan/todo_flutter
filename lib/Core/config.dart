import 'package:todo_app/Utils/constants.dart';

class AppConfig {
  static const devMode = true;
  var isLoggedIn = email != null && authTokenProvider != null ? true : false;
  static const logHttp = true;
  static const String version = 'atre_application_desktop_0.0.3';
}
