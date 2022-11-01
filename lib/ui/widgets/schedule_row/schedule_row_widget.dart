import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/ui/widgets/schedule_row/schedule_row_lecture_widget.dart';

abstract class ScheduleRowWidget extends StatelessWidget {
  const ScheduleRowWidget({Key? key}) : super(key: key);

  factory ScheduleRowWidget.single({Key? key}) =>
      _ScheduleSingleLectureWidget(key: key);

  factory ScheduleRowWidget.multi({Key? key}) =>
      _ScheduleMultiLectureWidget(key: key);
}

class _ScheduleSingleLectureWidget extends ScheduleRowWidget {
  const _ScheduleSingleLectureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const configuration = ScheduleRowLectureWidgetConfiguration(
        avatarUrl:
            'https://hiphop4real.com/wp-content/uploads/2017/06/YUriy-Dud.jpg',
        speakerName: 'Юрий Дудь',
        lectureTitle: 'Субъективность в оценке дизайна',
        isFavourite: false,
        status: ScheduleRowLectureWidgetConfigurationProgressStatus.current);
    return Row(
      children: const [
        Expanded(child: ScheduleRowLectureWidget(configuration: configuration)),
      ],
    );
  }
}

class _ScheduleMultiLectureWidget extends ScheduleRowWidget {
  const _ScheduleMultiLectureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// enum, который описывает статус лекции
enum ScheduleRowLectureWidgetConfigurationProgressStatus {
  past,
  current,
  coming
}
