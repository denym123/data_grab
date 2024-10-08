import 'package:mobx/mobx.dart';

import '../../../core/core.dart';

part 'splash_controller.g.dart';

class SplashController = SplashControllerBase with _$SplashController;

abstract class SplashControllerBase with Store, ControllerLifeCycle {
  @override
  void onInit([Map<String, dynamic>? params]) {
    init();
  }

  @action
  void init() async {
    await Future.delayed(const Duration(seconds: 2));
    AppRoutes.goToLogin();
  }
}
