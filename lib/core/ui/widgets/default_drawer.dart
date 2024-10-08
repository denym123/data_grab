import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Padding(
          //             padding: EdgeInsets.fromLTRB(28.w, 78.h, 0, 0),
          //             child: Text(
          //               Modular.get<UserStore>().userModel?.name ?? "",
          //               style: context.textStyles.bold.copyWith(
          //                 fontSize: 16.sp,
          //                 color: context.colors.primary,
          //               ),
          //             ),
          //           ),
          Padding(
            padding: EdgeInsets.fromLTRB(28.w, 8.h, 0, 0),
            child: Text(
              "Usuário",
              style: context.textStyles.regular.copyWith(
                fontSize: 16.sp,
                color: context.colors.primary,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 28.h, 0, 28.h),
            child: Divider(
              thickness: 1.w,
              height: 0,
            ),
          ),
          DefaultDrawerTile(
            title: 'Início',
            leading: const Icon(Icons.home),
            onTap: () {
            },
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 38.h),
            child: ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                shadowColor: Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.logout),
                  SizedBox(width: 16.w),
                  Text(
                    "Sair",
                    style: context.textStyles.medium.copyWith(
                      fontSize: 18.sp,
                      color: const Color(0XFFD22929),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
