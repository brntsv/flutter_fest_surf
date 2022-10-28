import 'package:flutter/cupertino.dart';

class MainTabsViewModel extends ChangeNotifier {
  var _currentTabIndex = 0;

  int get currentTabIndex => _currentTabIndex;

  set currentTabIndex(int value) {
    _currentTabIndex = value;
  }
}
