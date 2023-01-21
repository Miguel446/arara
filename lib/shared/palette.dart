import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor paletaRoxa = MaterialColor(
    0xffa071a0, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffaa7faa), //10%
      100: Color(0xffb38db3), //20%
      200: Color(0xffbd9cbd), //30%
      300: Color(0xffc6aac6), //40%
      500: Color(0xffd0b8d0), //60%
      600: Color(0xffd9c6d9), //70%
      700: Color(0xffe3d4e3), //80%
      800: Color(0xfff6f1f6), //90%
      900: Color(0xffffffff), //100%
    },
  );
}
