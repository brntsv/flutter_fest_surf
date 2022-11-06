import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/resources/app_fonts.dart';

abstract class AppTextStyle {
  static const button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    fontFamily: AppFonts.basisGrotesqueProRegular,
    height: 1.25,
    letterSpacing: 0.4,
  );

  static const bookText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontFamily: AppFonts.basisGrotesqueProRegular,
    height: 1.4285714286,
    letterSpacing: 0.0,
  );

  static const bookTextSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontFamily: AppFonts.basisGrotesqueProRegular,
    height: 1.33,
    letterSpacing: 0.4,
  );

  static const snackText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    fontFamily: AppFonts.basisGrotesqueProRegular,
    height: 1.33,
    letterSpacing: 0.4,
  );

  static const timeText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    fontFamily: AppFonts.basisGrotesqueProRegular,
    height: 1.375,
    letterSpacing: 0.0,
  );

  static const breakTimeElement = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    fontFamily: AppFonts.steinbeckRegular,
    height: 1.3,
    letterSpacing: 0.0,
  );

  static const breakTimeSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    fontFamily: AppFonts.basisGrotesqueProRegular,
    height: 1.6666666667,
    letterSpacing: 2.6,
  );

  static const speakerName = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    fontFamily: AppFonts.basisGrotesqueProRegular,
    height: 1.1666666667,
    letterSpacing: 0.0,
  );

  static const bookTextItalic = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    fontFamily: AppFonts.basisGrotesqueProItalic,
    height: 20 / 14,
    letterSpacing: 0.0,
  );

  static const steinbeckNormalText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    fontFamily: AppFonts.steinbeckRegular,
    height: 22 / 18,
    letterSpacing: 0.0,
  );

  static const steinbeckText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    fontFamily: AppFonts.steinbeckRegular,
    height: 28 / 24,
    letterSpacing: 0.0,
  );

  static const steinbeckHeadItalic = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    fontFamily: AppFonts.steinbeckItalic,
    height: 44 / 36,
    letterSpacing: 0.0,
  );

  static const steinbeckHeadNormal = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontFamily: AppFonts.steinbeckRegular,
    height: 44 / 36,
    letterSpacing: 0.0,
  );

  static const dialogTitle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontFamily: AppFonts.basisGrotesqueProRegular,
    height: 22 / 17,
    letterSpacing: 0.0,
  );

  static const dialogAction = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontFamily: AppFonts.basisGrotesqueProRegular,
    height: 22 / 17,
    letterSpacing: 0.0,
  );

  static const dialogCancelAction = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontFamily: AppFonts.basisGrotesqueProRegular,
    height: 22 / 17,
    letterSpacing: 0.0,
  );
}
