
import 'package:block_demo_dharmesh/core/asset/asset.dart';
import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../routes/animated_page_route.dart';



class AppTheme {
  const AppTheme();

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CustomOpenUpwardsPageTransitionsBuilder(),
        },
      ),
      fontFamily: poppinsSemiBold,
      navigationBarTheme:  NavigationBarThemeData(
        backgroundColor: AppColors.white
      ),
      colorScheme: const ColorScheme(
        background: AppColors.backgroundColorLight,
        onBackground: AppColors.onBackgroundColorLight,
        brightness: Brightness.light,
        primary: AppColors.primaryLight,
        onPrimary: AppColors.onPrimaryLight,
        secondary: AppColors.secondaryLight,
        onSecondary: AppColors.onSecondaryLight,
        error: AppColors.errorLight,
        onError: AppColors.onErrorLight,
        surface: AppColors.surfaceLight,
        onSurface: AppColors.onSurfaceLight,
      )
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CustomOpenUpwardsPageTransitionsBuilder(),
        },
      ),
      fontFamily: poppinsSemiBold,
      navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: AppColors.bottomNavigationBarDark
      ),
      colorScheme: const ColorScheme(
        background: AppColors.backgroundColorDark,
        onBackground: AppColors.onBackgroundColorDark,
        brightness: Brightness.dark,
        primary: AppColors.primaryDark,
        onPrimary: AppColors.onPrimaryDark,
        secondary: AppColors.secondaryDark,
        onSecondary: AppColors.onSecondaryDark,
        error: AppColors.errorDark,
        onError: AppColors.onErrorDark,
        surface: AppColors.surfaceDark,
        onSurface: AppColors.onSurfaceDark,
      )
    );
  }
}
