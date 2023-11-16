import 'package:flutter/material.dart';
import '../../Feature/Auth/View/login.dart';
import '../../Res/colors.dart';
import '../../Res/texts.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 800), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Login()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.black,
      body: Center(
        child: MyTexts().WhiteLogoText(size: 70),
      ),
    );
  }
}
