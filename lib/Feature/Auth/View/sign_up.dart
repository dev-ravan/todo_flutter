import 'package:todo_app/Feature/Auth/Controller/sign_up.dart';

import '../../../Utils/exports.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SignUpProvider>();
    return Scaffold(
      backgroundColor: Palette.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Logo
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Align(
                    alignment: Alignment.center,
                    child: MyTexts().LogoText(size: 40)),
              ),
              // Login Text
              MyTexts().TitleText(text: provider.title),
              gap5,
              MyTexts()
                  .DMSansNormalBlackText(size: 15, text: provider.subTitle),
              gap30,

              Form(
                  key: provider.formKey,
                  child: Column(
                    children: [
                      // Email Field
                      MyTextFields().authField(
                          validator: (value) => provider.emailValidation(value),
                          icon: Icons.mail,
                          controller: provider.emailController,
                          hintText: provider.email.hintText),
                      gap20,

                      // New Password Field
                      MyTextFields().authField(
                          validator: (value) =>
                              provider.newPasswordValidation(value),
                          obscure: true,
                          icon: Icons.key,
                          controller: provider.newPasswordController,
                          hintText: provider.newPassword.hintText),
                      gap20,
                      // Confirm Password Field
                      MyTextFields().authField(
                          validator: (value) =>
                              provider.repeatPasswordValidation(value),
                          obscure: true,
                          icon: Icons.key,
                          controller: provider.confirmPasswordController,
                          hintText: provider.repeatPassword.hintText),
                    ],
                  )),
              gap20,
              // Login Button
              MyButtons().customButton(
                  context: context,
                  title: provider.title,
                  onTap: () => provider.submitForm()),
              gap20,

              Row(
                children: [
                  MyTexts().DMSansNormalBlackText(
                      text: "Already you have an account?", size: 15),
                  gap5,
                  MyButtons().redButton(
                      title: "Login",
                      onTap: () {
                        Navigator.pop(context);
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
