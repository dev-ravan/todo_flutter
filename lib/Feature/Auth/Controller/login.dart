import 'package:todo_app/Utils/exports.dart';

class LoginProvider extends ChangeNotifier {
  // Navigation
  final GoRouter _router;
  LoginProvider(this._router);
  // Global form key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Text Editing Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Login Form Items

  String title = "Login";
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

  final password =
      FormItems(hintText: "Password", errorMsg: "Please enter password");

  // Validations
  String? emailValidation(String? val) => val!.isEmpty ? email.errorMsg : null;

  // New Password Validation
  String? passwordValidation(String? val) => val!.isEmpty
      ? password.errorMsg
      : val.length <= 6
          ? "Password should at least 6 digits"
          : null;

  // Submit the login form

  void submitForm() {
    if (formKey.currentState!.validate()) {
      _router.goRoute(const Home());
      print("Login successfully...");
    } else {
      print("Login failed...");
    }
  }

  // Reset Login Form

  void resetForm() => formKey.currentState?.reset();
}
