import 'package:flutter/material.dart';

abstract class AppTheme {
  static final light = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    cardColor: const Color(0xFF101115),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        unselectedItemColor: Color(0xFF52525E),
        selectedItemColor: Color(0xFF00BD13)),
  );
}
