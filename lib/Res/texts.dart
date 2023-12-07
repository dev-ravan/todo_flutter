// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme.dart';

class MyTexts {
  Widget LogoText({required double size}) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: "TO ",
            style: GoogleFonts.montserrat(
                color: Palette.red,
                fontSize: size,
                fontWeight: FontWeight.w500)),
        TextSpan(
            text: "DO",
            style: GoogleFonts.montserrat(
                color: Palette.black,
                fontSize: size,
                fontWeight: FontWeight.w400))
      ]),
    );
  }

  Widget WhiteLogoText({required double size}) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: "TO ",
            style: GoogleFonts.montserrat(
                color: Palette.red,
                fontSize: size,
                fontWeight: FontWeight.w500)),
        TextSpan(
            text: "DO",
            style: GoogleFonts.montserrat(
                color: Palette.white,
                fontSize: size,
                fontWeight: FontWeight.w400))
      ]),
    );
  }

  Widget TitleText({required String text}) {
    return Text(text,
        style: GoogleFonts.dmSans(
            color: Palette.black, fontSize: 35, fontWeight: FontWeight.bold));
  }

  Widget DMSansNormalBlackText({required String text, required double size}) {
    return Text(text,
        style: GoogleFonts.dmSans(
            color: Palette.black,
            fontSize: size,
            fontWeight: FontWeight.normal));
  }

  Widget DMSansNormalWhiteText({required String text, required double size}) {
    return Text(text,
        style: GoogleFonts.dmSans(
            color: Palette.white,
            fontSize: size,
            fontWeight: FontWeight.normal));
  }

  Widget MiniRedText({required String text}) {
    return Text(text,
        style: GoogleFonts.dmSans(
            color: Palette.red, fontSize: 15, fontWeight: FontWeight.normal));
  }
}
