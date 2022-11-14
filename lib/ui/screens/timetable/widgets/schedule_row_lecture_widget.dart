import 'package:flutter/material.dart';

import 'package:flutter_fest_surf/resources/resources.dart';
import 'package:flutter_fest_surf/ui/navigation/main_navigation.dart';
import 'package:flutter_fest_surf/ui/screens/timetable/widgets/schedule_row_widget.dart';
import 'package:flutter_fest_surf/ui/themes/app_text_style.dart';
import 'package:flutter_fest_surf/ui/themes/app_theme.dart';

class ScheduleRowLectureWidget extends StatelessWidget {
  final ScheduleRowLectureWidgetConfiguration configuration;
  const ScheduleRowLectureWidget({Key? key, required this.configuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding:
              const EdgeInsets.only(top: 15, left: 16, right: 12, bottom: 15),
          decoration: BoxDecoration(
              color: configuration._style.widgetBackground,
              // gradient: RadialGradient(
              //   colors: [
              //     const Color(0xFF00BD13),
              //     configuration._style.widgetBackground,
              //   ],
              //   center: Alignment.topRight,
              // ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SpeakerWidget(configuration: configuration),
              const SizedBox(height: 14),
              _DescriptionWidget(configuration: configuration),
            ],
          ),
        ),
        Card(
          elevation: 0,
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              Navigator.of(context).pushNamed(Screens.lectureDetails);
            },
          ),
        ),
        Positioned(
          right: 12,
          top: 4,
          child: _FavouriteWidget(
            configuration: configuration,
          ),
        ),
      ],
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
            style: AppTextStyle.bookText
                .copyWith(color: configuration._style.speakerNameColor),
          ),
        )
      ],
    );
  }
}

class _FavouriteWidget extends StatelessWidget {
  final ScheduleRowLectureWidgetConfiguration configuration;
  const _FavouriteWidget({Key? key, required this.configuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {},
      icon: Image.asset(
        configuration._favouriteStyle.favouriteButtonIcon,
        color: configuration._favouriteStyle.favouriteButtonColor,
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  final ScheduleRowLectureWidgetConfiguration configuration;
  const _DescriptionWidget({Key? key, required this.configuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      configuration.lectureTitle,
      style: AppTextStyle.steinbeckNormalText
          .copyWith(color: configuration._style.lectureTitleColor),
    );
  }
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

// стили для избранных лекций
class _ScheduleRowLectureWidgetConfigurationFavouriteStyle {
  final Color? favouriteButtonColor;
  final Color? backgroundGradientColor;
  final String favouriteButtonIcon;

  const _ScheduleRowLectureWidgetConfigurationFavouriteStyle({
    required this.favouriteButtonColor,
    required this.backgroundGradientColor,
    required this.favouriteButtonIcon,
  });
}

//конфигуратор всех параметров лекции
class ScheduleRowLectureWidgetConfiguration {
  final String avatarUrl;
  final String speakerName;
  final String lectureTitle;
  final String jobTitle;
  final bool isFavourite;
  // статус прогресса
  final ScheduleRowWidgetConfigurationProgressStatus status;

  // геттер, стиль виджета зависит от статуса
  _ScheduleRowLectureWidgetConfigurationStyle get _style {
    switch (status) {
      case ScheduleRowWidgetConfigurationProgressStatus.past:
        return pastStyle;
      case ScheduleRowWidgetConfigurationProgressStatus.current:
      case ScheduleRowWidgetConfigurationProgressStatus.coming:
        return comingStyle;
    }
  }

  // геттер на избранное, смена стиля при нажатии на букмарк
  _ScheduleRowLectureWidgetConfigurationFavouriteStyle get _favouriteStyle =>
      isFavourite ? isFavouriteStyle : isNotFavouriteStyle;

  const ScheduleRowLectureWidgetConfiguration({
    required this.avatarUrl,
    required this.speakerName,
    required this.lectureTitle,
    required this.jobTitle,
    required this.isFavourite,
    required this.status,
  });

  // описываем стили через статические константы
  static const pastStyle = _ScheduleRowLectureWidgetConfigurationStyle(
    widgetBackground: Colors.transparent,
    speakerNameColor: AppColors.darkText48,
    lectureTitleColor: AppColors.darkText,
  );

  static const comingStyle = _ScheduleRowLectureWidgetConfigurationStyle(
    widgetBackground: AppColors.darkSecondary,
    speakerNameColor: AppColors.darkText,
    lectureTitleColor: Colors.white,
  );

  static const isFavouriteStyle =
      _ScheduleRowLectureWidgetConfigurationFavouriteStyle(
    favouriteButtonColor: AppColors.green,
    backgroundGradientColor: AppColors.green,
    favouriteButtonIcon: AppImages.bookmarkFull,
  );

  static const isNotFavouriteStyle =
      _ScheduleRowLectureWidgetConfigurationFavouriteStyle(
    favouriteButtonColor: null,
    backgroundGradientColor: null,
    favouriteButtonIcon: AppImages.bookmark,
  );
}
