import 'package:flutter/material.dart';
import 'package:todo_app/Res/theme.dart';

final myTextFields = MyTextFields();

class MyTextFields {
  TextFormField authField(
      {required String hintText,
      required TextEditingController controller,
      String? Function(String?)? validator,
      bool? obscure,
      required IconData icon}) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscure ?? false,
      cursorColor: Palette.black,
      decoration: InputDecoration(
        focusColor: Palette.white,
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Palette.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Palette.black)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Palette.red)),
      ),
    );
  }

// Address Field
  TextFormField addressField(
      {required String hintText,
      required TextEditingController controller,
      required String? Function(String?) validator,
      bool? obscure,
      required IconData icon}) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: 3,
      obscureText: obscure ?? false,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Palette.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Palette.black)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Palette.red)),
      ),
    );
  }

// Message text field
  TextFormField sendMessageField({
    required TextEditingController controller,
    required Function onTap,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            icon: const Icon(Icons.send), onPressed: onTap as void Function()),
        hintText: "Type here..",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Palette.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Palette.black)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Palette.red)),
      ),
    );
  }
}
