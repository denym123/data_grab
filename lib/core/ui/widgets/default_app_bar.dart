import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core.dart';
class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasDrawer;
  final VoidCallback? onBackPressed;
  const DefaultAppBar({
    super.key,
    required this.title,
    this.hasDrawer = false,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: context.textStyles.bold.copyWith(
          color: Colors.white,
          fontSize: 16.sp,
        ),
      ),
      actions: [
      ],
      leading: Builder(builder: (context) {
        if (Modular.routerDelegate.canPop()) {
          return IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24.r,
            ),
            onPressed: onBackPressed ??
                () {
                  Modular.to.pop();
                },
          );
        }
        if (hasDrawer) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }
        return const SizedBox();
      }),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 24.r,
      ),
    );
  }

  @override
  Size get preferredSize => Size(1.sw, 48.h);
}
