import 'package:todo_app/Utils/exports.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    final provider = context.watch<LoginProvider>();
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
              MyTexts().DMSansNormalBlackText(
                  text: "Please login to continue app", size: 15),
              gap30,

              // Email Field
              Form(
                key: provider.formKey,
                child: Column(
                  children: [
                    MyTextFields().authField(
                        validator: (value) => provider.email.errorMsg,
                        icon: Icons.mail,
                        controller: provider.emailController,
                        hintText: provider.email.hintText),
                    gap20,

                    // Password Field
                    MyTextFields().authField(
                        validator: (value) => provider.password.errorMsg,
                        obscure: true,
                        icon: Icons.key,
                        controller: provider.passwordController,
                        hintText: provider.password.hintText),
                  ],
                ),
              ),
              gap20,
              // Login Button
              MyButtons().customButton(
                context: context,
                title: provider.title,
                onTap: () {
                  provider.submitForm();
                },
              ),
              gap20,
              Row(
                children: [
                  MyTexts().DMSansNormalBlackText(
                      text: "Don't have an account?", size: 15),
                  gap5,
                  MyButtons().redButton(
                      title: "Register",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
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
