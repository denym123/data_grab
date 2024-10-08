import 'package:mobx/mobx.dart';

import '../../../core/core.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store, ControllerLifeCycle {

}
