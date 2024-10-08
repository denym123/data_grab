import 'package:flutter/material.dart';

import 'sqlite_connection_factory.dart';

class SqliteAdmConnection with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    var connection = SqliteConnectionFactory();

    switch (state) {
      case AppLifecycleState.resumed:
      case AppLifecycleState.hidden:
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        connection.closeConnection();
    }
    super.didChangeAppLifecycleState(state);
  }
}
