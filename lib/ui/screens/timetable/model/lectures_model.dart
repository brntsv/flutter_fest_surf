import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/entity/lectures.dart';
import 'package:flutter_fest_surf/entity/schedule.dart';

import 'package:flutter_fest_surf/ui/screens/timetable/widgets/schedule_row_lecture_widget.dart';
import 'package:flutter_fest_surf/ui/screens/timetable/widgets/schedule_row_time_widget.dart';

class LecturesModel extends ChangeNotifier {
  /// Внутреннее приватное состояние лекций.
  final List<ScheduleRowLectureWidgetConfiguration> _items = listOfLectures;

  /// Неизменяемое представление лекций.
  List<ScheduleRowLectureWidgetConfiguration> get lectures => _items;

  /// Внутреннее приватное состояние расписания.
  final List<ScheduleRowTimeWidgetConfiguration> _itemsTime = listOfTime;

  /// Неизменяемое представление расписания.
  List<ScheduleRowTimeWidgetConfiguration> get timeOfLectures => _itemsTime;

  /// Список для избраных лекций
  final List<ScheduleRowLectureWidgetConfiguration> _favourites = [];
  List<ScheduleRowLectureWidgetConfiguration> get favourites => _favourites;

  /// Расписание для избраных лекций
  final List<ScheduleRowTimeWidgetConfiguration> _favouritesTime = [];
  List<ScheduleRowTimeWidgetConfiguration> get favouritesTime =>
      _favouritesTime;

  /// метод добавления/удаления из избранного лекции
  void toggleFavourite(ScheduleRowLectureWidgetConfiguration item) {
    final isExist = _favourites.contains(item);
    if (isExist) {
      _favourites.remove(item);
    } else {
      _favourites.add(item);
    }
    _favourites.sort((a, b) => a.id.compareTo(b.id));
    notifyListeners();
  }

  /// метод такой же как выше, только для расписания
  void toggleFavSchedule(ScheduleRowTimeWidgetConfiguration item) {
    final isExist = _favouritesTime.contains(item);
    if (isExist) {
      _favouritesTime.remove(item);
    } else {
      _favouritesTime.add(item);
    }
    _favouritesTime.sort((a, b) => a.id.compareTo(b.id));
    notifyListeners();
  }

  /// проверка для переключения иконки
  bool isExists(ScheduleRowLectureWidgetConfiguration item) {
    final isExist = _favourites.contains(item);
    return isExist;
  }
}
