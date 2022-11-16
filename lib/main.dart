import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/ui/app/app.dart';
import 'package:flutter_fest_surf/ui/screens/timetable/model/lectures_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<LecturesModel>(
      child: MyApp(),
      create: (_) => LecturesModel(),
    ),
  );
}
