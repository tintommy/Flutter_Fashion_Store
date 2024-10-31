import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  static final darkTheme = ThemeData(
      primaryColor: Color(0xff382d50),

      shadowColor: Colors.black54,
      dialogBackgroundColor: Color(0xff342F3F),
      brightness: Brightness.dark,
      iconTheme: const IconThemeData(color: Colors.white),
      primaryIconTheme: const IconThemeData(
        color: Colors.white,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Colors.white,
        ),
      ),
      colorScheme: const ColorScheme.dark()
          .copyWith(secondary: Colors.grey.shade900)
          .copyWith(background: Colors.black),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Colors.white,
        contentTextStyle: TextStyle(color: Colors.black),
      ),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.darkSecondBackground,
          hintStyle: const TextStyle(
            color: Color(0xffA7A7A7),
            fontWeight: FontWeight.w400,
          ),
          contentPadding: const EdgeInsets.all(16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.darkPrimary,
              elevation: 10,
              foregroundColor: Colors.white,
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)))));

  static final lightTheme = ThemeData(
      primaryColor: Colors.black,
      dialogBackgroundColor: Color(0xffb4b4b4),
      shadowColor: Colors.white54,
      brightness: Brightness.light,
      iconTheme: const IconThemeData(color: Colors.black),
      primaryIconTheme: const IconThemeData(
        color: Colors.black,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Colors.black,
        ),
      ),
      colorScheme: const ColorScheme.light().copyWith(background: Colors.white),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.lightSecondBackground,
          hintStyle: const TextStyle(
            color: Color(0xffA7A7A7),
            fontWeight: FontWeight.w400,
          ),
          contentPadding: const EdgeInsets.all(16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none)),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Colors.black,
        contentTextStyle: TextStyle(color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.lightPrimary,
              elevation: 10,
              foregroundColor: Colors.white,
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)))));
}
