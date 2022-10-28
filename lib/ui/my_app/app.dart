import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/ui/screens/timetable_screen.dart';
import 'package:flutter_fest_surf/ui/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      home: const TimetableScreen(),
    );
  }
}
