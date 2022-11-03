import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/ui/themes/app_text_style.dart';
import 'package:flutter_fest_surf/ui/themes/app_theme.dart';

class DialogWidgetIos extends StatelessWidget {
  const DialogWidgetIos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: CupertinoAlertDialog(
        title: const Text(
            'Хотите получить напоминание за 10 минут до начала лекции?'),
        actions: [
          CupertinoDialogAction(
              onPressed: () => Navigator.pop(context, 'Не надо'),
              child: Text(
                'Не надо',
                style: AppTextStyle.dialogCancelAction
                    .copyWith(color: AppColors.green),
              )),
          CupertinoDialogAction(
              onPressed: () => Navigator.pop(context, 'Да'),
              child: Text(
                'Да',
                style:
                    AppTextStyle.dialogAction.copyWith(color: AppColors.green),
              )),
        ],
      ),
    );
  }
}
