import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/core.dart';
import '../../../core/models/user_model.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store, ControllerLifeCycle {
  final LocalSecureStorage _localSecureStorage =
      Modular.get<LocalSecureStorage>();

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  TextEditingController cpfController = TextEditingController();

  @observable
  bool isLoading = false;

  @action
  Future<void> save() async {
    isLoading = true;
    Modular.get<UserStore>().login(UserModel(
      name: nameController.text,
      document: cpfController.text,
    ));
    await Future.wait([
      _localSecureStorage.write(
          LocalStorageConstants.USER_NAME, nameController.text),
      _localSecureStorage.write(
          LocalStorageConstants.USER_DOCUMENT, cpfController.text)
    ]).then(
      (value) {
        AppRoutes.goToHome();
      },
    ).whenComplete(() {
      isLoading = false;
    });
  }
}
