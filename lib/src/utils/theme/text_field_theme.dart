import 'package:flutter/material.dart';
import 'package:login/src/constants/colors.dart';

class TextFormFieldTheme {
  TextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(),
      prefixIconColor: secondaryColor,
      floatingLabelStyle: TextStyle(color: secondaryColor),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: secondaryColor),
          ));

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(),
      prefixIconColor: primaryColor,
      floatingLabelStyle: TextStyle(color: primaryColor),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: primaryColor),
          ));
}

