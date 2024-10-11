import 'package:data_grab/core/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
 import 'package:mobx/mobx.dart';

 import '../core.dart';

 part 'user_store.g.dart';

 class UserStore = UserStoreBase with _$UserStore;

 abstract class UserStoreBase with Store {

   @readonly
   UserModel? _userModel;

   @action
   void login(UserModel userModel) {
     Modular.get<LocalSecureStorage>().write(
         LocalStorageConstants.USER_NAME, userModel.name);
     Modular.get<LocalSecureStorage>().write(
         LocalStorageConstants.USER_DOCUMENT, userModel.document);
     _userModel = userModel;
   }
   @action
   void logout() {
     Modular.get<LocalSecureStorage>().clear();
     AppRoutes.goToLogin();
   }
 }