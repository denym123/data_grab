//import 'package:flutter_modular/flutter_modular.dart';
// import 'package:mobx/mobx.dart';
//
// import '../core.dart';
//
// part 'user_store.g.dart';
//
// class UserStore = UserStoreBase with _$UserStore;
//
// abstract class UserStoreBase with Store {
//   @readonly
//   UserModel? _userModel;
//
//   @readonly
//   CredentialModel? _credentialModel;
//
//   Future<bool> hasCredential() {
//     return Modular.get<LocalSecureStorage>()
//         .read(LocalStorageConstants.CLIENT_TOKEN)
//         .then((value) => value != null);
//   }
//
//   @action
//   void setUserModel(UserModel? userModel) {
//     _userModel = userModel;
//   }
//
//   @action
//   void setCredentialModel(CredentialModel? credentialModel) {
//     Modular.get<LocalSecureStorage>()
//         .write(LocalStorageConstants.CLIENT_TOKEN, credentialModel!.token);
//   }
//
//   @action
//   void logout() {
//     setUserModel(null);
//     Modular.get<LocalSecureStorage>().clear();
//     AppRoutes.goToLogin();
//   }
// }