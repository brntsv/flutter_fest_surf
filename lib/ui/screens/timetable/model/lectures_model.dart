import 'package:flutter/material.dart';

import 'package:flutter_fest_surf/ui/screens/timetable/widgets/schedule_row_lecture_widget.dart';
import 'package:flutter_fest_surf/ui/screens/timetable/widgets/schedule_row_time_widget.dart';
import 'package:flutter_fest_surf/ui/screens/timetable/widgets/schedule_row_widget.dart';

class LectureModel {}

List<ScheduleRowLectureWidgetConfiguration> _listOfLectures = [
  ScheduleRowLectureWidgetConfiguration(
    id: 1,
    avatarUrl:
        'https://i0.wp.com/sova.ponominalu.ru/wp-content/uploads/2018/04/post-malone.jpg?fit=800%2C600&ssl=1',
    speakerName: 'Алексей Чулпин',
    lectureTitle: 'Субъективность в оценке дизайна',
    jobTitle: 'Дизайн-директор Яндекс.Маркет',
    isFavourite: false,
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  ScheduleRowLectureWidgetConfiguration(
    id: 2,
    avatarUrl: 'https://tagline.ru/file/person/photo/2018/grigory-kochenov.png',
    speakerName: 'Гриша Коченов',
    lectureTitle: 'Непрошенная мораль про веб-дизайн',
    jobTitle: 'Креативный директор Agima',
    isFavourite: false,
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  ScheduleRowLectureWidgetConfiguration(
    id: 3,
    avatarUrl: 'https://greatheart.ru/assets/img/birthday/maksim-ponomarev.png',
    speakerName: 'Максим Понаморев',
    lectureTitle: 'Личный бренд в творческой профессии',
    jobTitle: 'Ведущий разработчик МТС',
    isFavourite: false,
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  ScheduleRowLectureWidgetConfiguration(
    id: 4,
    avatarUrl:
        'https://hiphop4real.com/wp-content/uploads/2017/06/YUriy-Dud.jpg',
    speakerName: 'Юрий Дудь',
    lectureTitle: 'Как не стесняться вопроса "Сколько ты зарабатываешь?"',
    jobTitle: 'блогер',
    isFavourite: false,
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  ScheduleRowLectureWidgetConfiguration(
    id: 5,
    avatarUrl:
        'https://pbs.twimg.com/profile_images/442246336553840640/tmlikWP-_400x400.jpeg',
    speakerName: 'Артём Малышев',
    lectureTitle: 'Продюсирование проектов и творческий взгляд',
    jobTitle: 'Подкаст "мы обречены"',
    isFavourite: false,
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  ScheduleRowLectureWidgetConfiguration(
    id: 6,
    avatarUrl:
        'https://images.ctfassets.net/9n3x4rtjlya6/47d55e95eURFdV4mlWzuur/ac7f0780a6ebba3f5cfa1a96fc54eaab/___________________.jpg',
    speakerName: 'Фил Ранжин',
    lectureTitle: 'Масштабирование проекта с ограниченными ресурсами',
    jobTitle: 'С# разработчик',
    isFavourite: false,
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  ScheduleRowLectureWidgetConfiguration(
    id: 7,
    avatarUrl:
        'https://yt3.ggpht.com/ytc/AMLnZu89Ctj5mdefLspTmrKyy8VEBepwP38o8kBHvldVbg=s900-c-k-c0x00ffffff-no-rj',
    speakerName: 'Егор Малькевич',
    lectureTitle: 'Мотитвация себя и других',
    jobTitle: 'стартапы',
    isFavourite: false,
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
];

List<ScheduleRowTimeWidgetConfiguration> _listOfTime = [
  const ScheduleRowTimeWidgetConfiguration(
    id: 1,
    startTime: '  8:00',
    endTime: '  9:30',
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  const ScheduleRowTimeWidgetConfiguration(
    id: 2,
    startTime: '  9:35',
    endTime: '11:00',
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  const ScheduleRowTimeWidgetConfiguration(
    id: 3,
    startTime: '11:30',
    endTime: '13:00',
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  const ScheduleRowTimeWidgetConfiguration(
    id: 4,
    startTime: '13:05',
    endTime: '14:30',
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  const ScheduleRowTimeWidgetConfiguration(
    id: 5,
    startTime: '15:00',
    endTime: '16:30',
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  const ScheduleRowTimeWidgetConfiguration(
    id: 6,
    startTime: '16:35',
    endTime: '17:30',
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  const ScheduleRowTimeWidgetConfiguration(
    id: 7,
    startTime: '18:00',
    endTime: '19:30',
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
];

class LecturesProvider extends ChangeNotifier {
  /// Внутреннее приватное состояние лекций.
  final List<ScheduleRowLectureWidgetConfiguration> _items = _listOfLectures;

  /// Неизменяемое представление лекций.
  List<ScheduleRowLectureWidgetConfiguration> get lectures => _items;

  /// Внутреннее приватное состояние расписания.
  final List<ScheduleRowTimeWidgetConfiguration> _itemsTime = _listOfTime;

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
