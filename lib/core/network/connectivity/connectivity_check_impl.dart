import 'dart:async';

import '../../core.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityCheckImpl implements ConnectivityCheck {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _streamSubscription;

  @override
  void start() {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      if (event.first == ConnectivityResult.wifi ||
          event.first == ConnectivityResult.mobile) {
        isConnected = true;
      } else {
        isConnected = false;
      }
    });
  }

  @override
  void stop() {
    _streamSubscription?.cancel();
  }

  @override
  bool? isConnected;
}
