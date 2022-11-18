import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/ui/screens/timetable/widgets/schedule_row_widget.dart';
import 'package:flutter_fest_surf/ui/themes/app_text_style.dart';
import 'package:flutter_fest_surf/ui/themes/app_theme.dart';

class ScheduleRowTimeWidget extends StatelessWidget {
  final int index;
  final ScheduleRowTimeWidgetConfiguration configuration;
  const ScheduleRowTimeWidget({
    Key? key,
    required this.configuration,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Row(
        children: [
          Column(
            children: [
              Text(configuration.startTime,
                  style: AppTextStyle.bookTextSmall
                      .copyWith(color: configuration._style.startColor)),
              const Spacer(),
              Text(configuration.endTime,
                  style: AppTextStyle.bookTextSmall
                      .copyWith(color: configuration._style.endColor)),
            ],
          ),
          const SizedBox(width: 12),
          Column(
            children: [
              Expanded(
                  child: _DividerWidget(
                color: configuration._style.startColor,
                position: _DividerWidgetPosition.top,
              )),
              Expanded(
                  child: _DividerWidget(
                color: configuration._style.endColor,
                position: _DividerWidgetPosition.bottom,
              )),
            ],
          ),
        ],
      ),
    );
  }
}

enum _DividerWidgetPosition { top, bottom }

class _DividerWidget extends StatelessWidget {
  final Color color;
  final _DividerWidgetPosition position;

  const _DividerWidget({Key? key, required this.color, required this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(20);
    final borderRadius = position == _DividerWidgetPosition.top
        ? const BorderRadius.only(topLeft: radius, topRight: radius)
        : const BorderRadius.only(bottomLeft: radius, bottomRight: radius);
    return SizedBox(
      width: 2,
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, borderRadius: borderRadius),
        child: Container(),
      ),
    );
  }
}

class _ScheduleRowTimeWidgetConfigurationConfigurationStyle {
  final Color startColor;
  final Color endColor;

  const _ScheduleRowTimeWidgetConfigurationConfigurationStyle({
    required this.startColor,
    required this.endColor,
  });
}

class ScheduleRowTimeWidgetConfiguration {
  final String startTime;
  final String endTime;
  final ScheduleRowWidgetConfigurationProgressStatus status;

  const ScheduleRowTimeWidgetConfiguration({
    required this.startTime,
    required this.endTime,
    required this.status,
  });

  _ScheduleRowTimeWidgetConfigurationConfigurationStyle get _style {
    switch (status) {
      case ScheduleRowWidgetConfigurationProgressStatus.past:
        return pastStyle;
      case ScheduleRowWidgetConfigurationProgressStatus.current:
        return currentStyle;
      case ScheduleRowWidgetConfigurationProgressStatus.coming:
        return comingStyle;
    }
  }

  static const pastStyle =
      _ScheduleRowTimeWidgetConfigurationConfigurationStyle(
    startColor: AppColors.darkText72,
    endColor: AppColors.darkText72,
  );

  static const currentStyle =
      _ScheduleRowTimeWidgetConfigurationConfigurationStyle(
    startColor: AppColors.darkText72,
    endColor: AppColors.green72,
  );

  static const comingStyle =
      _ScheduleRowTimeWidgetConfigurationConfigurationStyle(
    startColor: AppColors.white72,
    endColor: AppColors.white72,
  );
}
