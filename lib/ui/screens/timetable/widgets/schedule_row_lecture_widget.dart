import 'package:flutter/material.dart';

import 'package:flutter_fest_surf/resources/resources.dart';
import 'package:flutter_fest_surf/ui/navigation/main_navigation.dart';
import 'package:flutter_fest_surf/ui/screens/main/viewmodel/main_view_model.dart';
import 'package:flutter_fest_surf/ui/screens/timetable/model/lectures_model.dart';
import 'package:flutter_fest_surf/ui/screens/timetable/widgets/schedule_row_widget.dart';
import 'package:flutter_fest_surf/ui/themes/app_text_style.dart';
import 'package:flutter_fest_surf/ui/themes/app_theme.dart';
import 'package:flutter_fest_surf/ui/widgets/top_notifications/top_notification_manager.dart';
import 'package:provider/provider.dart';

class ScheduleRowLectureWidget extends StatelessWidget {
  final int index;
  final ScheduleRowLectureWidgetConfiguration configuration;
  const ScheduleRowLectureWidget(
      {Key? key, required this.configuration, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favouriteGradient = RadialGradient(
      radius: 3,
      colors: AppColors.radialGradient,
      center: const Alignment(2.1, -2.4),
      stops: const [0.1, 0.9, 1],
    );
    return Stack(
      children: [
        Container(
          padding:
              const EdgeInsets.only(top: 15, left: 16, right: 12, bottom: 15),
          decoration: BoxDecoration(
              color: configuration._style.widgetBackground,
              gradient: configuration.isFavourite ? favouriteGradient : null,
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
            index: index,
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
          radius: 12,
          backgroundImage: AssetImage(configuration.avatar),
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
  final int index;
  final ScheduleRowLectureWidgetConfiguration configuration;
  const _FavouriteWidget({
    Key? key,
    required this.configuration,
    required this.index,
  }) : super(key: key);

  void showOverlay(BuildContext context) {
    final provider = context.read<TopNotificationManager>();
    if (configuration.isFavourite == false) {
      provider.show('???????????? ?????????????????? ?? ??????????????????');
    } else {
      provider.show('???????????? ?????????????? ???? ??????????????????');
    }

    //TODO: ????????????????????
    // showDialog<String>(
    //   context: context,
    //   builder: (BuildContext context) => BackdropFilter(
    //     filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
    //     child: const DialogWidgetIos(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LecturesModel>();
    final watch = context.watch<LecturesModel>();
    final lectures = watch.lectures;
    final timeOfLectures = watch.timeOfLectures;
    final favourites = watch.favourites;
    final favouritesTime = watch.favouritesTime;
    // ???????????? ???? ???????????? ?????????? ?? ???????????????????????? ???? ???????????????????? ???????????????? ???????????? ??????????
    final currentTabIndex =
        context.select((MainTabsViewModel vm) => vm.currentTabIndex);
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        showOverlay(context);
        if (currentTabIndex == 0) {
          provider.toggleFavourite(lectures[index]);
          provider.toggleFavSchedule(timeOfLectures[index]);
          provider.isExists(lectures[index])
              ? configuration.isFavourite = true
              : configuration.isFavourite = false;
        } else if (currentTabIndex == 1) {
          provider.toggleFavourite(favourites[index]);
          provider.toggleFavSchedule(favouritesTime[index]);
          configuration.isFavourite = false;
        }
      },
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

//?????????? ?????? ???????????? ????????????, ?????????????????? ???? ?????????????? ????????????
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

// ?????????? ?????? ?????????????????? ????????????
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

//???????????????????????? ???????? ???????????????????? ????????????
class ScheduleRowLectureWidgetConfiguration {
  final int id;
  final String avatar;
  final String speakerName;
  final String lectureTitle;
  final String jobTitle;
  bool isFavourite;
  // ???????????? ??????????????????
  final ScheduleRowWidgetConfigurationProgressStatus status;

  // ????????????, ?????????? ?????????????? ?????????????? ???? ??????????????
  _ScheduleRowLectureWidgetConfigurationStyle get _style {
    switch (status) {
      case ScheduleRowWidgetConfigurationProgressStatus.past:
        return pastStyle;
      case ScheduleRowWidgetConfigurationProgressStatus.current:
      case ScheduleRowWidgetConfigurationProgressStatus.coming:
        return comingStyle;
    }
  }

  // ???????????? ???? ??????????????????, ?????????? ?????????? ?????? ?????????????? ???? ??????????????
  _ScheduleRowLectureWidgetConfigurationFavouriteStyle get _favouriteStyle =>
      isFavourite ? isFavouriteStyle : isNotFavouriteStyle;

  ScheduleRowLectureWidgetConfiguration({
    required this.id,
    required this.avatar,
    required this.speakerName,
    required this.lectureTitle,
    required this.jobTitle,
    required this.isFavourite,
    required this.status,
  });

  // ?????????????????? ?????????? ?????????? ?????????????????????? ??????????????????
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
