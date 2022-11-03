import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/ui/themes/app_text_style.dart';
import 'package:flutter_fest_surf/ui/themes/app_theme.dart';

class NotificationOverlayWidget extends StatefulWidget {
  const NotificationOverlayWidget({Key? key}) : super(key: key);

  @override
  State<NotificationOverlayWidget> createState() =>
      NotificationOverlayWidgetState();
}

class NotificationOverlayWidgetState extends State<NotificationOverlayWidget> {
  static const _showedOffset = Offset(0, 0);
  static const _hidedOffset = Offset(0, -1);
  // -1 означает, что она будет смещена наверх ровно на свою высоту
  Timer? _timer;
  var _offset = _hidedOffset; // значение по дефолту
  var _text = '';

  void show(String text) {
    setState(() {
      _text = text;
      _offset = _showedOffset; // смена оффсета, анимация срабатывает
    });
    _timer = Timer(const Duration(seconds: 2), () {
      setState(() {
        _offset = _hidedOffset; // по таймеру меняем оффсет в исходное положение
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AnimatedSlide(
        offset: _offset,
        duration: const Duration(milliseconds: 200),
        child: Material(
          child: Container(
            padding: EdgeInsets.only(top: topPadding),
            color: AppColors.green,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Center(
                child: Text(
                  _text,
                  style: AppTextStyle.snackText,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
