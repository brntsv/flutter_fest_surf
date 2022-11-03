import 'package:flutter/material.dart';
import 'package:flutter_fest_surf/ui/widgets/top_notifications/notification_overlay_widget.dart';
import 'package:provider/provider.dart';

abstract class TopNotificationManager {
  void show(String text);
}

class TopNotificationManagerWidget extends StatefulWidget {
  final Widget? child;
  const TopNotificationManagerWidget({Key? key, this.child}) : super(key: key);

  @override
  State<TopNotificationManagerWidget> createState() =>
      _TopNotificationManagerWidgetState();
}

class _TopNotificationManagerWidgetState
    extends State<TopNotificationManagerWidget>
    implements TopNotificationManager {
  final _notificationOverlayWidgetKey =
      GlobalKey<NotificationOverlayWidgetState>();

  @override
  Widget build(BuildContext context) {
    var childrenStack = <Widget>[];
    final child = widget.child;
    if (child != null) {
      childrenStack.add(child);
    }

    final notificationOverlayWidget =
        NotificationOverlayWidget(key: _notificationOverlayWidgetKey);

    childrenStack.add(notificationOverlayWidget);
    return Provider<TopNotificationManager>.value(
      value: this,
      child: Stack(children: childrenStack),
    );
  }

  @override
  void show(String text) {
    _notificationOverlayWidgetKey.currentState?.show(text);
  }
}
