import 'package:flutter/material.dart';

const maxScreenWidth = 400.0;

abstract class AppTheme {
  static final light = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: AppColors.darkBackground,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBackground,
      selectedItemColor: AppColors.green,
      unselectedItemColor: AppColors.darkText,
    ),
  );
}

abstract class AppColors {
  static const green = Color(0xFF00BD13);
  static const green72 = Color(0xB700BD13);
  static const blue = Color(0xFF170AF4);
  static const darkBackground = Color(0xFF000000);
  static const darkSecondary = Color(0xFF101115);
  static const darkText = Color(0xFF52525E);
  static const darkText48 = Color(0x7A52525E);
  static const darkText72 = Color(0xB752525E);
  static const white = Color(0xFFFFFFFF);
  static const white72 = Color(0xB7FFFFFF);
  static const white88 = Color(0xE0FFFFFF);
  static const gradientGreenBlue = [AppColors.green, AppColors.blue];
  static const gradientOff = [AppColors.darkSecondary, AppColors.darkSecondary];
}
// расчет цвета с прозрачностью 88 процентов. 255 х 0.88 = 224.4
// dec to hex online - получаем EO и вставляем вместо FF
