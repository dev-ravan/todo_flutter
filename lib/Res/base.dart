import '../Core/config.dart';

class BasePaths {
  static const baseImagePath = "assets/images";
  static const baseAnimationPath = "assets/animations";
  static const basePlaceholderPath = "assets/placeholders";
  static const baseProdUrl =
      "https://tr.atrehealthtech.com/beta-atre/api-v2/admin";
  static const baseTestUrl = "localhost:3000";
  static const baseUrl = AppConfig.devMode ? baseProdUrl : baseTestUrl;
}
