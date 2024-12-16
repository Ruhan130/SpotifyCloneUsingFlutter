import 'package:flutter/material.dart';
import 'package:project/core/config/theme/app_color.dart';

class Apptheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColor.primary,
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    scaffoldBackgroundColor: AppColor.lightBackground,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.primary,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    )),
  );


  static final darkTheme = ThemeData(
    primaryColor: AppColor.primary,
    brightness: Brightness.dark,
    fontFamily: 'Satoshi',
    scaffoldBackgroundColor: AppColor.darkBackground,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.primary,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    )),
  );
}
