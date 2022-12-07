import 'package:flutter_fest_surf/resources/resources.dart';
import 'package:flutter_fest_surf/ui/screens/timetable/widgets/schedule_row_lecture_widget.dart';
import 'package:flutter_fest_surf/ui/screens/timetable/widgets/schedule_row_widget.dart';

List<ScheduleRowLectureWidgetConfiguration> listOfLectures = [
  ScheduleRowLectureWidgetConfiguration(
    id: 1,
    avatar: AppImages.avatarChulpin,
    speakerName: 'Алексей Чулпин',
    lectureTitle: 'Субъективность в оценке дизайна',
    jobTitle: 'Дизайн-директор Яндекс.Маркет',
    isFavourite: false,
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  ScheduleRowLectureWidgetConfiguration(
    id: 2,
    avatar: AppImages.avatarKochenov,
    speakerName: 'Гриша Коченов',
    lectureTitle: 'Непрошенная мораль про веб-дизайн',
    jobTitle: 'Креативный директор Agima',
    isFavourite: false,
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  ScheduleRowLectureWidgetConfiguration(
    id: 3,
    avatar: AppImages.avatarPonamorev,
    speakerName: 'Максим Понаморев',
    lectureTitle: 'Личный бренд в творческой профессии',
    jobTitle: 'Ведущий разработчик МТС',
    isFavourite: false,
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  ScheduleRowLectureWidgetConfiguration(
    id: 4,
    avatar: AppImages.avatarDud,
    speakerName: 'Юрий Дудь',
    lectureTitle: 'Как не стесняться вопроса "Сколько ты зарабатываешь?"',
    jobTitle: 'блогер',
    isFavourite: false,
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  ScheduleRowLectureWidgetConfiguration(
    id: 5,
    avatar: AppImages.avatarMalyshev,
    speakerName: 'Артём Малышев',
    lectureTitle: 'Продюсирование проектов и творческий взгляд',
    jobTitle: 'Подкаст "мы обречены"',
    isFavourite: false,
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  ScheduleRowLectureWidgetConfiguration(
    id: 6,
    avatar: AppImages.avatarRanzhin,
    speakerName: 'Фил Ранжин',
    lectureTitle: 'Масштабирование проекта с ограниченными ресурсами',
    jobTitle: 'С# разработчик',
    isFavourite: false,
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
  ScheduleRowLectureWidgetConfiguration(
    id: 7,
    avatar: AppImages.avatarMalkevich,
    speakerName: 'Егор Малькевич',
    lectureTitle: 'Мотитвация себя и других',
    jobTitle: 'стартапы',
    isFavourite: false,
    status: ScheduleRowWidgetConfigurationProgressStatus.coming,
  ),
];
