import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/ui/themes/app_text_style.dart';
import 'package:flutter_fest_surf/ui/themes/app_theme.dart';

class DialogWidgetAndroid extends StatelessWidget {
  const DialogWidgetAndroid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
          'Хотите получить напоминание за 10 минут до начала лекции?'),
      titleTextStyle: AppTextStyle.dialogTitle.copyWith(color: AppColors.white),
      backgroundColor: AppColors.darkSecondary,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18))),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: Text(
            'Не надо',
            style: AppTextStyle.dialogCancelAction
                .copyWith(color: AppColors.green),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: Text(
            'Да',
            style: AppTextStyle.dialogAction.copyWith(color: AppColors.green),
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.spaceAround,
    );
  }
}

// Этот виджет нигде не применяется, он написан для взаимозаменяемости
// В проектe используется CupertinoWidget
