import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/ui/screens/timetable/model/lectures_model.dart';
import 'package:flutter_fest_surf/ui/screens/timetable/widgets/schedule_row_break_widget.dart';
import 'package:flutter_fest_surf/ui/screens/timetable/widgets/schedule_row_lecture_widget.dart';
import 'package:flutter_fest_surf/ui/screens/timetable/widgets/schedule_row_time_widget.dart';
import 'package:provider/provider.dart';

abstract class ScheduleRowWidget extends StatelessWidget {
  const ScheduleRowWidget({Key? key}) : super(key: key);

  // factory ScheduleRowWidget.single({Key? key}) =>
  //     _ScheduleSingleLectureWidget(key: key);

  factory ScheduleRowWidget.multi({Key? key}) =>
      _ScheduleMultiLectureWidget(key: key);
}

// class _ScheduleSingleLectureWidget extends ScheduleRowWidget {
//   const _ScheduleSingleLectureWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const progressStatus = ScheduleRowWidgetConfigurationProgressStatus.coming;
//     var configLecture = ScheduleRowLectureWidgetConfiguration(
//       avatarUrl:
//           'https://hiphop4real.com/wp-content/uploads/2017/06/YUriy-Dud.jpg',
//       speakerName: 'Юрий Дудь',
//       lectureTitle: 'Субъективность в оценке дизайна',
//       jobTitle: 'Дизайн-директор Яндекс.Маркет',
//       isFavourite: false,
//       status: progressStatus,
//     );

//     const configTime = ScheduleRowTimeWidgetConfiguration(
//       startTime: '8:00',
//       endTime: '10:00',
//       status: progressStatus,
//     );

//     return IntrinsicHeight(
//       child: Row(
//         children: [
//           const ScheduleRowTimeWidget(configuration: configTime),
//           Expanded(
//               child: ScheduleRowLectureWidget(configuration: configLecture)),
//         ],
//       ),
//     );
//   }
// }

class _ScheduleMultiLectureWidget extends ScheduleRowWidget {
  const _ScheduleMultiLectureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lectures = context.watch<LecturesModel>().lectures;
    var timeOfLectures = context.watch<LecturesModel>().timeOfLectures;

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
          child: IntrinsicHeight(
            child: Row(
              children: [
                // !!!!!!!!!!! listOfTime
                ScheduleRowTimeWidget(
                  configuration: timeOfLectures[index],
                  index: index,
                ),
                Expanded(
                  child:
                      // !!!!!!!!! listOfLectures
                      ScheduleRowLectureWidget(
                    configuration: lectures[index],
                    index: index,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      separatorBuilder: (context, index) {
        if ((index + 1) % 2 == 0) {
          return const Padding(
            padding: EdgeInsets.only(left: 14, right: 14, top: 16),
            child: SizedBox(
              height: 70,
              child: ScheduleRowBreakWidget(),
            ),
          );
        }
        return const SizedBox.shrink();
      },
      itemCount: lectures.length,
    );
  }
}

// enum, который описывает статус лекции
enum ScheduleRowWidgetConfigurationProgressStatus { past, current, coming }
