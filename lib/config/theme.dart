import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/font_size_provider.dart';

final appThemeProvider = Provider<AppTheme>((ref) {
  final fontSizeFactor = ref.watch(fontSizeFactorProvider);

  return AppTheme(fontSizeFactor: fontSizeFactor);
});

class AppTheme {
  AppTheme({this.fontSizeFactor = 1});

  final double fontSizeFactor;

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

  static const black400 = Color(0xFFBCBCBC);
  static const black600 = Color(0xFF747474);
  static const black800 = Color(0xFF414141);

  static const pagePadding = EdgeInsets.fromLTRB(20, 0, 20, 50);

  static const headlineTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: black800,
  );

  static const bodyTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: black800,
  );

  static const labelTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: black800,
  );

  late final textTheme = TextTheme(
    headlineMedium: headlineTextStyle,
    bodySmall: bodyTextStyle.copyWith(fontSize: 12),
    bodyMedium: bodyTextStyle,
    bodyLarge: bodyTextStyle.copyWith(fontSize: 16),
    labelSmall: labelTextStyle.copyWith(fontSize: 12),
    labelMedium: labelTextStyle,
  ).apply(
    fontSizeFactor: fontSizeFactor,
  );

  static const buttonMinimumSize = Size.fromHeight(56);
  static final borderRadius = BorderRadius.circular(24);

  ThemeData get themeData => ThemeData(
        fontFamily: 'Inter',
        useMaterial3: false,
        primarySwatch: primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        dividerColor: Colors.grey[400],
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: primary,
          ),
          titleTextStyle: headlineTextStyle,
        ),
        iconTheme: const IconThemeData(
          color: secondary,
        ),
        textTheme: textTheme,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: borderRadius,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            minimumSize: buttonMinimumSize,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
            disabledBackgroundColor: primary[500],
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            minimumSize: buttonMinimumSize,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.grey[600],
            textStyle: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: primary,
          unselectedItemColor: Colors.grey[400],
        ),
        tabBarTheme: TabBarTheme(
          labelPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          labelColor: textTheme.bodyMedium?.color,
          dividerColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: const UnderlineTabIndicator(
            insets: EdgeInsets.fromLTRB(30, 0, 30, -1.5),
            borderSide: BorderSide(
              color: AppTheme.primary,
              width: 3,
            ),
          ),
        ),
      );

  ThemeData get darkThemeData => themeData.copyWith(
        scaffoldBackgroundColor: Colors.grey[800],
        appBarTheme: themeData.appBarTheme.copyWith(
          backgroundColor: Colors.grey[800],
        ),
        textTheme: textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        inputDecorationTheme: themeData.inputDecorationTheme.copyWith(
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: Colors.grey[500]!),
          ),
          iconColor: Colors.grey[500],
          suffixIconColor: Colors.grey[500],
          prefixIconColor: Colors.grey[500],
          floatingLabelStyle: const TextStyle(color: primary),
          labelStyle: TextStyle(color: Colors.grey[500]),
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            minimumSize: buttonMinimumSize,
            side: BorderSide(color: Colors.grey[500]!),
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            textStyle:
                textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.grey[500],
            textStyle: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        bottomNavigationBarTheme: themeData.bottomNavigationBarTheme.copyWith(
          backgroundColor: Colors.grey[700],
        ),
        dialogTheme: DialogTheme(
          backgroundColor: Colors.grey[700],
        ),
        checkboxTheme: CheckboxThemeData(
          side: BorderSide(color: Colors.grey[500]!, width: 1.5),
        ),
        tabBarTheme: themeData.tabBarTheme.copyWith(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey[500],
        ),
      );
}
