import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../modules/modules.dart';
import '../../core.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16.w, 32.h, 16.w, 24.h),
            decoration: BoxDecoration(
              color: context.colors.primary,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  Modular.get<UserStore>().userModel?.name ?? "",
                  style: context.textStyles.bold
                      .copyWith(color: Colors.white, fontSize: 20.sp),
                ),
                Text(
                    Modular.get<UserStore>().userModel?.document ?? "Documento",
                    style: context.textStyles.medium
                        .copyWith(color: Colors.white, fontSize: 16.sp)),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          ListTile(
            onTap: () {
              Modular.get<HomeController>().exportAllDeliveryDataToExcel();
            },
            title: Text(
              "Exportar tudo",
              style: context.textStyles.semiBold16,
            ),
            leading: Icon(
              Icons.file_upload,
              size: 24.r,
            ),
          ),
          Spacer(),
          ListTile(
            title: Text(
              "Sair",
              style: context.textStyles.semiBold16.copyWith(color: Colors.red),
            ),
            onTap: () {
              Modular.get<UserStore>().logout();
              AppRoutes.goToLogin();
            },
            leading: Icon(
              Icons.logout,
              size: 24.r,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
