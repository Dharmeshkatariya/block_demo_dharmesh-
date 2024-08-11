import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static Color appColor = const Color(0xff53C3D2);
  static Color authFiledColor = const Color(0xFFC2C2C2);
  static Color yellow = const Color(0xFFeeb902);
  static Color yellow1 = Colors.yellow;
  static Color white = const Color.fromARGB(255, 255, 255, 255);
  static Color navyBlue = const Color(0xFF222F3F);
  static Color blue = const Color(0xFF03152A);
  static Color lightBlue = const Color(0xFFC4CFEE);
  static Color black = const Color(0xFF000000);
  static Color black2 = const Color(0xFF000000);
  static Color grey = const Color(0xFFC2C2C2);
  static Color grey2 = const Color(0xFFF0E7E7);
  static Color blueDark = const Color(0xFF0d00a4);
  static Color grey3 = const Color(0xFF4a4e69);
  static Color darkBlue1 = const Color(0xFF22333b);
  static Color darkGrey = const Color(0xff292e2f);
  static Color darkGrey1 = const Color(0xFF303030);
  static Color red = const Color(0xFFFE4545);



  /// light
  static const Color backgroundColorLight = Color(0xffffffff);
  static const Color onBackgroundColorLight = Color(0xff121212);
  static const Color bottomNavigationBarLight = Color(0xffffffff);
  static const Color primaryLight = Color(0xff7050d9);
  static const Color onPrimaryLight = Color(0xfffefefe);
  static const Color secondaryLight = Color(0xff8768DD);
  static const Color onSecondaryLight = Color(0xff8596A0);
  static const Color borderLight = Color(0xff5F44B9);
  static const Color errorLight = Colors.redAccent;
  static const Color onErrorLight = Color(0xffffffff);
  static const Color surfaceLight = Color(0xff7050d9);
  static const Color onSurfaceLight = Color(0xffffffff);
  static const Color bottomNavigationBarDividerColorLight = Color(0xffeeeeee);
  static const Color chatPageSystemNavigationBarColorLight = Color(0xff5F44B9);
  static const Color rightMessageColorLight = Color(0xffcecbff);
  static const Color leftMessageColorLight = Color(0xffffffff);
  static const Color rightMessageTextColorLight = Color(0xff222222);
  static const Color leftMessageTextColorLight = Color(0xff222222);

  /// dark
  static const Color backgroundColorDark = Color(0xff121212);
  static const Color onBackgroundColorDark = Color(0xffffffff);
  static const Color bottomNavigationBarDark = Color(0xff121212);
  static const Color primaryDark = Color(0xff443463);
  static const Color onPrimaryDark = Color(0xffaaa1c2);
  static const Color secondaryDark = Color(0xff774efa);
  static const Color onSecondaryDark = Color(0xffBBB7C6);
  static const Color borderDark = Color(0xff5F44B9);
  static const Color errorDark = Colors.redAccent;
  static const Color onErrorDark = Color(0xffffffff);
  static const Color surfaceDark = Color(0xff7050d9);
  static const Color onSurfaceDark = Color(0xffBBB7C6);
  static const Color bottomNavigationBarDividerColorDark = Color(0xff222222);
  static const Color chatPageSystemNavigationBarColorDark = Color(0xFF2F2653);
  static const Color rightMessageColorDark = Color(0xff5F44B9);
  static const Color leftMessageColorDark = Color(0xff443463);
  static const Color rightMessageTextColorDark = Color(0xffeeeeee);
  static const Color leftMessageTextColorDark = Color(0xffeeeeee);

  static InputBorder formDecoration() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: AppColors.black, width: 0.5));
  }

  static InputBorder errorDecoration() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: AppColors.red, width: 1));
  }
}
