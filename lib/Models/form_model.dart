import 'package:flutter/services.dart';

class FormItems {
  final String hintText;
  final String? errorMsg;
  final List<TextInputFormatter> formatters;

  FormItems(
      {this.hintText = "", this.errorMsg = "", this.formatters = const []});
}
