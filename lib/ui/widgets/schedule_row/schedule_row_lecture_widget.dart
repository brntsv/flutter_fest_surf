import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/resources/app_fonts.dart';
import 'package:flutter_fest_surf/resources/resources.dart';

class ScheduleRowLectureWidget extends StatelessWidget {
  final ScheduleRowLectureWidgetConfiguration configuration;
  const ScheduleRowLectureWidget({Key? key, required this.configuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275,
      height: 112,
      padding: const EdgeInsets.only(top: 4, left: 16, right: 8, bottom: 16),
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: _SpeakerWidget(
                configuration: configuration,
              )),
              _FavouriteButton(
                configuration: configuration,
              ),
            ],
          ),
          _DescriptionWidget(configuration: configuration),
        ],
      ),
    );
  }
}

class _SpeakerWidget extends StatelessWidget {
  final ScheduleRowLectureWidgetConfiguration configuration;
  const _SpeakerWidget({Key? key, required this.configuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            configuration.avatarUrl,
            // 'https://hiphop4real.com/wp-content/uploads/2017/06/YUriy-Dud.jpg',
          ),
          radius: 12,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            configuration.speakerName,
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: AppFonts.basisGrotesqueProRegular,
              fontWeight: FontWeight.w500,
              height: 1.43,
            ),
          ),
        )
      ],
    );
  }
}

class _FavouriteButton extends StatelessWidget {
  final ScheduleRowLectureWidgetConfiguration configuration;
  const _FavouriteButton({Key? key, required this.configuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icon =
        configuration.isFavourite ? AppImages.bookmarkFull : AppImages.bookmark;
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {},
      icon: Image.asset(icon),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  final ScheduleRowLectureWidgetConfiguration configuration;
  const _DescriptionWidget({Key? key, required this.configuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        configuration.lectureTitle,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
          color: Colors.white.withOpacity(0.88),
          fontSize: 18,
          fontFamily: AppFonts.steinbeckRegular,
          fontWeight: FontWeight.w400,
          height: 1.22,
        ),
      ),
    );
  }
}

// enum, который описывает статус лекции
enum ScheduleRowLectureWidgetConfigurationProgressStatus {
  past,
  current,
  coming
}

//класс для стилей лекции, зависящих от статуса лекции
class _ScheduleRowLectureWidgetConfigurationStyle {
  final Color widgetBackground;
  final Color speakerNameColor;
  final Color lectureTitleColor;

  const _ScheduleRowLectureWidgetConfigurationStyle({
    required this.widgetBackground,
    required this.speakerNameColor,
    required this.lectureTitleColor,
  });
}

//конфигуратор всех параметров лекции
class ScheduleRowLectureWidgetConfiguration {
  final String avatarUrl;
  final String speakerName;
  final String lectureTitle;
  final bool isFavourite;
  // статус прогресса
  final ScheduleRowLectureWidgetConfigurationProgressStatus status;

  // стиль виджета зависит от статуса
  _ScheduleRowLectureWidgetConfigurationStyle get _style {
    switch (status) {
      case ScheduleRowLectureWidgetConfigurationProgressStatus.past:
        return pastStyle;
      case ScheduleRowLectureWidgetConfigurationProgressStatus.current:
      case ScheduleRowLectureWidgetConfigurationProgressStatus.coming:
        return comingStyle;
    }
  }

  const ScheduleRowLectureWidgetConfiguration({
    required this.avatarUrl,
    required this.speakerName,
    required this.lectureTitle,
    required this.isFavourite,
    required this.status,
  });

  // описываем стили через статические константы
  static const pastStyle = _ScheduleRowLectureWidgetConfigurationStyle(
    widgetBackground: Colors.transparent,
    speakerNameColor: Color(0x7A52525E),
    lectureTitleColor: Color(0xFF52525E),
  );

  static const comingStyle = _ScheduleRowLectureWidgetConfigurationStyle(
    widgetBackground: Color(0xFF101115),
    speakerNameColor: Color(0xFF52525E),
    lectureTitleColor: Colors.white,
  );
}
