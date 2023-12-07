// ignore_for_file: unused_field, unused_local_variable

import 'package:todo_app/Utils/exports.dart';

class SignUpProvider extends ChangeNotifier {
  // Global form key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Loading
  bool isLoading = false;

  // Text Editing Controllers
  final emailController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Login Form Items
  String title = "Sign Up";
  String subTitle = "Require information for account creation";
  final email = FormItems(
      hintText: "Email",
      errorMsg: "Please enter a valid email",
      formatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
              r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
              r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
              r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
              r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
              r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
              r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])'),
        ),
      ]);

  final newPassword = FormItems(
      hintText: "New Password", errorMsg: "Please enter new password");

  final repeatPassword = FormItems(
      hintText: "Repeat Password", errorMsg: "Please enter repeat password");

  // [Validations]

  // Email Validation
  String? emailValidation(String? val) => val!.isEmpty ? email.errorMsg : null;

  // New Password Validation
  String? newPasswordValidation(String? val) => val!.isEmpty
      ? newPassword.errorMsg
      : val.length < 6
          ? "Password should at least 6 digits"
          : null;

  // Repeat Password Validation
  String? repeatPasswordValidation(String? val) => val!.isEmpty
      ? newPassword.errorMsg
      : val.length < 6
          ? "Password should at least 6 digits"
          : null;

  // It changes the loading state
  setLoading(bool loading) async {
    isLoading = loading;
    notifyListeners();
  }

  // Submit the login form
  void submitForm() {
    if (formKey.currentState!.validate()) {
    } else {
      print("Sign up failed...");
    }
  }

  // Reset Login Form
  void resetForm() => formKey.currentState?.reset();
}
