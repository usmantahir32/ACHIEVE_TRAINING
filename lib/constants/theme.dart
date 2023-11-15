import 'package:flutter/material.dart';
import 'package:training/constants/colors.dart';
import '../utils/size_config.dart';

class AppTheme {
  final ThemeData primaryTheme = ThemeData(
    textTheme: TextTheme(
      displaySmall: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: SizeConfig.textMultiplier * 1.2),
      bodySmall: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: SizeConfig.textMultiplier * 1.4),
      bodyMedium: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: SizeConfig.textMultiplier * 1.6),
      bodyLarge: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: SizeConfig.textMultiplier * 1.8),
      displayLarge: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: SizeConfig.textMultiplier * 2),
      headlineSmall: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: SizeConfig.textMultiplier * 2.2),
      headlineMedium: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: SizeConfig.textMultiplier * 2.5),
      headlineLarge: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: SizeConfig.textMultiplier * 2.8),
    ),
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: const Color(0xFFF5F6FA),
    colorScheme: ColorScheme.light(primary: AppColors.primaryClr),
  );
  getTheme() {
    return primaryTheme;
  }
}
