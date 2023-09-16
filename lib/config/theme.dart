import 'package:flutter/material.dart';

abstract class AppTheme {
  static const primary = MaterialColor(
    0xFFA071A0,
    <int, Color>{
      50: Color(0xFFAA7FAA),
      100: Color(0xFFB38DB3),
      200: Color(0xFFBD9CBD),
      300: Color(0xFFC6AAC6),
      500: Color(0xFFD0B8D0),
      600: Color(0xFFD9C6D9),
      700: Color(0xFFE3D4E3),
      800: Color(0xFFF6F1F6),
      900: Color(0xFFFFFFFF),
    },
  );

  static const secondary = Color(0xFF75A760);

  static const black600 = Color(0xFF747474);
  static const black800 = Color(0xFF414141);

  static const pagePadding = EdgeInsets.fromLTRB(20, 0, 20, 50);

  static get themeData => ThemeData(
        fontFamily: 'Inter',
        primarySwatch: primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: primary,
          ),
        ),
        iconTheme: const IconThemeData(
          color: secondary,
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: black800,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: black800,
          ),
          labelMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: black800,
          ),
        ),
      );
}
