import 'package:flutter/material.dart';
import 'package:ppildo/app/utils/app_colors.dart';

class AppThemeData {
  static ThemeData themeData = ThemeData(
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryColor,
    dialogBackgroundColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.primaryColor,
    splashColor: AppColors.black,
    highlightColor: AppColors.black,
    // fontFamily: Fonts.libreBaskerville,
    dividerColor: AppColors.grey,
    indicatorColor: AppColors.black,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black,
    ),

//TextTheme
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontSize: 19.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontSize: 18.5,
        fontWeight: FontWeight.w700,
        color: Color(0xFF28a745),
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
    //ElevatedButtonThemeData
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.black),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
      ),
    ),
  );
}
