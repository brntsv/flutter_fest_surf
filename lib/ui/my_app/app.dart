import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/ui/navigation/main_navigation.dart';
import 'package:flutter_fest_surf/ui/screens/timetable_screen.dart';
import 'package:flutter_fest_surf/ui/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  final mainNavigation = MainNavigation();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      routes: mainNavigation.routes,
      onGenerateRoute: mainNavigation.onGenerateRoute,
      home: const TimetableScreen(),
    );
  }
}
