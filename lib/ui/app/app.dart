import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/ui/navigation/main_navigation.dart';
import 'package:flutter_fest_surf/ui/themes/app_theme.dart';
import 'package:flutter_fest_surf/ui/widgets/top_notifications/top_notification_manager.dart';

class MyApp extends StatelessWidget {
  final mainNavigation = MainNavigation();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      routes: mainNavigation.routes,
      onGenerateRoute: mainNavigation.onGenerateRoute,
      // этот builder позволеяет строить какой-то виджет между MaterialApp и
      // Navigator'ом
      builder: (_, child) => TopNotificationManagerWidget(child: child),
      // выдаётся child, этот child будет Navigator'ом. Navigator передаётся в
      // child TopNotificationManager. TopNotificationManager будет вокруг Navigator'a
    );
  }
}
