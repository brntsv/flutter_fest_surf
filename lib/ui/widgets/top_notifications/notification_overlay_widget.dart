import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/ui/themes/app_theme.dart';

class NotificationOverlayWidget extends StatelessWidget {
  final Widget child;
  const NotificationOverlayWidget({Key? key, required this.child})
      : super(key: key);

  static OverlayEntry makeOverlayEntry(Widget child) {
    return OverlayEntry(
      builder: (_) => NotificationOverlayWidget(child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Material(
        child: Container(
          padding: EdgeInsets.only(top: topPadding),
          color: AppColors.green,
          child: child,
        ),
      ),
    );
  }
}
