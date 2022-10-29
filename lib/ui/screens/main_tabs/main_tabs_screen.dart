import 'package:flutter/material.dart';

import 'package:flutter_fest_surf/resources/resources.dart';
import 'package:flutter_fest_surf/ui/screens/main_tabs/main_tabs_view_model.dart';
import 'package:flutter_fest_surf/ui/screens/main_tabs/schedule_widget.dart';
import 'package:provider/provider.dart';

class MainTabsScreen extends StatelessWidget {
  const MainTabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _BodyWidget(),
      bottomNavigationBar: _BottomNavBarWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex =
        context.select((MainTabsViewModel vm) => vm.currentTabIndex);
    return IndexedStack(
      index: currentIndex,
      children: const [
        ScheduleWidget(),
        Center(
          child: Text(
            '2',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Center(
          child: Text(
            '3',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class _BottomNavBarWidget extends StatelessWidget {
  const _BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex =
        context.select((MainTabsViewModel vm) => vm.currentTabIndex);
    final model = context.read<MainTabsViewModel>();

    final theme = Theme.of(context).bottomNavigationBarTheme;

    final buttons = [
      _BottomNavigationBarItemFactory(AppImages.tabbarCalendar),
      _BottomNavigationBarItemFactory(AppImages.tabbarBookmark),
      _BottomNavigationBarItemFactory(AppImages.tabbarPoint),
    ]
        .asMap()
        .map((index, value) {
          return MapEntry(index, value.build(index, currentIndex, theme));
        })
        .values
        .toList();

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: model.setCurrentTabIndex,
      items: buttons,
    );
  }
}

class _BottomNavigationBarItemFactory {
  final String iconName;

  _BottomNavigationBarItemFactory(this.iconName);

  BottomNavigationBarItem build(
    int index,
    int currentIndex,
    BottomNavigationBarThemeData theme,
  ) {
    final selectedColor = theme.selectedItemColor;
    final unselectedColor = theme.unselectedItemColor;

    final color = index == currentIndex ? selectedColor : unselectedColor;
    return BottomNavigationBarItem(
      icon: Image.asset(
        iconName,
        color: color,
      ),
      label: '',
    );
  }
}
