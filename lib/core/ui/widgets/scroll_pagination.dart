import 'package:flutter/material.dart';

class ScrollPagination extends StatelessWidget {
  const ScrollPagination({
    required this.child,
    required this.loading,
    required this.isFinish,
    required this.callback,
    super.key,
  });

  final Widget child;
  final bool loading;
  final bool isFinish;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollMetricsNotification &&
            notification.metrics.pixels >=
                notification.metrics.maxScrollExtent) {
          if (!loading && !isFinish) {
            callback();
          }
        }

        return true;
      },
      child: child,
    );
  }
}
