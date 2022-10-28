import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/ui/screens/screen_factory/screen_factory.dart';

abstract class Screens {
  static const main = '/';
}

class MainNavigation {
  final screenFactory = ScreenFactory();

  Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
        Screens.main: (_) => screenFactory.makeMainTabs(),
      };

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return null;
  }
}
