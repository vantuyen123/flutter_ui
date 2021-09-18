import 'package:flutter/material.dart';
import 'package:flutter_ui_18/themes/app_color.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: AppColor.bodyColorDark,
    scaffoldBackgroundColor: AppColor.bodyColorDark,
    hintColor: AppColor.textColor,
    primaryColorLight: AppColor.buttonBackgroundColorDark,
    textTheme: TextTheme(
        headline1: TextStyle(
            color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
    buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary, buttonColor: Colors.white));
