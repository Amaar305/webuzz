import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webuzz/core/theme/app_pallete.dart';

class AppTheme {
  static final ThemeData webuzzTheme = ThemeData(
    primaryColor: const Color(0xFFFFCC00),
    primaryColorDark: const Color(0xFFCC9900),
    primaryColorLight: const Color(0xFFFFE699),
    splashColor: const Color(0xFF0099FF),
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffff6699),
        foregroundColor: AppPallete.kWhiteColour,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
  );
  static const _appBarTheme = AppBarTheme(
    elevation: 0,
    backgroundColor: AppPallete.kTransparentColour,
    shadowColor: AppPallete.kTransparentColour,
  );
  static _border([Color color = AppPallete.kInputBorderColour]) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: color,
        ),
      );

  static ThemeData appDarkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.kBlackColour,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppPallete.kPrimaryColour,
      secondary: AppPallete.kGreyColour,
      surface: AppPallete.kDarkBackgroundColour,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(Typography.whiteCupertino),
    appBarTheme: _appBarTheme,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(20),
      focusedBorder: _border(AppPallete.kPrimaryColour),
      enabledBorder: _border(),
      errorBorder: _border(AppPallete.kRedColour),
      border: _border(),
      hintStyle: const TextStyle(
        color: AppPallete.kInputTextColour,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    ),
  );
  static ThemeData appLightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppPallete.kPrimaryColour,
      secondary: AppPallete.kGreyColour,
      surface: AppPallete.kGreyColour,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: _appBarTheme,
    dividerTheme: const DividerThemeData(
      color: AppPallete.kInputBorderColour,
      thickness: 0.8,
      indent: 20,
      endIndent: 20,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(20),
      focusedBorder: _border(AppPallete.kPrimaryColour),
      enabledBorder: _border(),
      errorBorder: _border(AppPallete.kRedColour),
      border: _border(),
      hintStyle: const TextStyle(
        color: AppPallete.kInputTextColour,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    ),
  );
}
