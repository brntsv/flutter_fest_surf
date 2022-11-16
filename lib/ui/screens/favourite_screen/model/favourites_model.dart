import 'package:flutter/material.dart';

import 'package:flutter_fest_surf/ui/screens/timetable/widgets/schedule_row_lecture_widget.dart';
import 'package:flutter_fest_surf/ui/screens/timetable/widgets/schedule_row_time_widget.dart';
import 'package:flutter_fest_surf/ui/screens/timetable/widgets/schedule_row_widget.dart';

// class Favourites {
//   final String avatarUrl;
//   final String speakerName;
//   final String lectureTitle;
//   final String jobTitle;
//   final bool isFavourite;
//   final ScheduleRowWidgetConfigurationProgressStatus status;
//   Favourites({
//     required this.avatarUrl,
//     required this.speakerName,
//     required this.lectureTitle,
//     required this.jobTitle,
//     required this.isFavourite,
//     required this.status,
//   });
// }

List<ScheduleRowLectureWidgetConfiguration> listOfLectures = [
  const ScheduleRowLectureWidgetConfiguration(
    avatarUrl:
        'https://i0.wp.com/sova.ponominalu.ru/wp-content/uploads/2018/04/post-malone.jpg?fit=800%2C600&ssl=1',
    speakerName: 'Алексей Чулпин',
    lectureTitle: 'Субъективность в оценке дизайна',
    jobTitle: 'Дизайн-директор Яндекс.Маркет',
    isFavourite: false,
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  const ScheduleRowLectureWidgetConfiguration(
    avatarUrl: 'https://tagline.ru/file/person/photo/2018/grigory-kochenov.png',
    speakerName: 'Гриша Коченов',
    lectureTitle: 'Непрошенная мораль про веб-дизайн',
    jobTitle: 'Креативный директор Agima',
    isFavourite: false,
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  const ScheduleRowLectureWidgetConfiguration(
    avatarUrl: 'https://greatheart.ru/assets/img/birthday/maksim-ponomarev.png',
    speakerName: 'Максим Понаморев',
    lectureTitle: 'Личный бренд в творческой профессии',
    jobTitle: 'Ведущий разработчик МТС',
    isFavourite: false,
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  const ScheduleRowLectureWidgetConfiguration(
    avatarUrl:
        'https://hiphop4real.com/wp-content/uploads/2017/06/YUriy-Dud.jpg',
    speakerName: 'Юрий Дудь',
    lectureTitle: 'Как не стесняться вопроса "Сколько ты зарабатываешь?"',
    jobTitle: 'блогер',
    isFavourite: false,
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  const ScheduleRowLectureWidgetConfiguration(
    avatarUrl:
        'https://pbs.twimg.com/profile_images/442246336553840640/tmlikWP-_400x400.jpeg',
    speakerName: 'Артём Малышев',
    lectureTitle: 'Продюсирование проектов и творческий взгляд',
    jobTitle: 'Подкаст "мы обречены"',
    isFavourite: false,
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  const ScheduleRowLectureWidgetConfiguration(
    avatarUrl:
        'https://images.ctfassets.net/9n3x4rtjlya6/47d55e95eURFdV4mlWzuur/ac7f0780a6ebba3f5cfa1a96fc54eaab/___________________.jpg',
    speakerName: 'Фил Ранжин',
    lectureTitle: 'Масштабирование проекта с ограниченными ресурсами',
    jobTitle: 'С# разработчик',
    isFavourite: false,
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  const ScheduleRowLectureWidgetConfiguration(
    avatarUrl:
        'https://yt3.ggpht.com/ytc/AMLnZu89Ctj5mdefLspTmrKyy8VEBepwP38o8kBHvldVbg=s900-c-k-c0x00ffffff-no-rj',
    speakerName: 'Егор Малькевич',
    lectureTitle: 'Мотитвация себя и других',
    jobTitle: 'стартапы',
    isFavourite: false,
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
];

List<ScheduleRowTimeWidgetConfiguration> listOfTime = [
  const ScheduleRowTimeWidgetConfiguration(
    startTime: '  8:00',
    endTime: '  9:30',
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  const ScheduleRowTimeWidgetConfiguration(
    startTime: '  9:35',
    endTime: '11:00',
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  const ScheduleRowTimeWidgetConfiguration(
    startTime: '11:30',
    endTime: '13:00',
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  const ScheduleRowTimeWidgetConfiguration(
    startTime: '13:05',
    endTime: '14:30',
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  const ScheduleRowTimeWidgetConfiguration(
    startTime: '15:00',
    endTime: '16:30',
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  const ScheduleRowTimeWidgetConfiguration(
    startTime: '16:35',
    endTime: '17:30',
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  const ScheduleRowTimeWidgetConfiguration(
    startTime: '18:00',
    endTime: '19:30',
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
];

class FavouritesModel extends ChangeNotifier {
  /// Внутреннее приватное состояние лекций.
  final List<ScheduleRowLectureWidgetConfiguration> _items = listOfLectures;

  /// Неизменяемое представление лекций.
  List<ScheduleRowLectureWidgetConfiguration> get lectures => _items;

  /// Внутреннее приватное состояние расписания.
  final List<ScheduleRowTimeWidgetConfiguration> _itemsTime = listOfTime;

  /// Неизменяемое представление расписания.
  List<ScheduleRowTimeWidgetConfiguration> get timeOfLectures => _itemsTime;

  ////               /////                 /////////////
  void add(ScheduleRowLectureWidgetConfiguration item) {
    _items.add(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
