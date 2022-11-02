import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/ui/themes/app_text_style.dart';

class TopOverlayWidget extends StatelessWidget {
  final String text;
  const TopOverlayWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: Center(
        child: Text(
          'Лекция добавлена в программу',
          style: AppTextStyle.snackText,
        ),
      ),
    );
  }
}

class TopNotificationManager extends StatefulWidget {
  final Widget? child;
  const TopNotificationManager({Key? key, this.child}) : super(key: key);

  @override
  State<TopNotificationManager> createState() => _TopNotificationManagerState();
}

class _TopNotificationManagerState extends State<TopNotificationManager> {
  @override
  Widget build(BuildContext context) {
    return widget.child ?? Container();
  }
}
