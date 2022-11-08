import 'package:flutter/material.dart';

import 'package:flutter_fest_surf/resources/resources.dart';
import 'package:flutter_fest_surf/ui/screens/favourite_screen/favourite_screen.dart';
import 'package:flutter_fest_surf/ui/screens/main/viewmodel/main_view_model.dart';
import 'package:flutter_fest_surf/ui/screens/map_screen/map_screen.dart';
import 'package:flutter_fest_surf/ui/screens/timetable/timetable_widget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

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
        FavourireScreenWidget(),
        MapScreen(),
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
      _BottomNavigationBarItemFactory(AppImages.bookmark),
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
