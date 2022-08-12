import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
    backgroundColor: const Color(0xFFf5f5f5),
    primaryColor: const Color(0xFF000000),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    primaryColorLight: Colors.black,
    cardColor: const Color(0xFFF5F5F5),
  );
  static final dark = ThemeData(
    backgroundColor: const Color(0xFF424242),
    primaryColor: const Color(0xFFFFFFFF),
    scaffoldBackgroundColor: const Color(0xFF030303), //const Color(0xFF424242),
    primaryColorLight: Colors.white,
    cardColor: const Color(0xFF464646),
  );
}
