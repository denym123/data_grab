import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core.dart';

class AppRoutes {
  AppRoutes._();

  static void goToLogin() {
    Modular.to.navigate(Routes.login);
  }

  static void goToHome() {
    Modular.to.navigate(Routes.home);
  }
}
