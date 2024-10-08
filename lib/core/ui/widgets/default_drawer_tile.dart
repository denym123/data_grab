import 'package:flutter/material.dart';

import '../../core.dart';

class DefaultDrawerTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Widget? leading;
  final EdgeInsetsGeometry? contentPadding;
  const DefaultDrawerTile({
    super.key,
    required this.title,
    this.onTap,
    this.leading,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      style: ListTileStyle.drawer,
      contentPadding: contentPadding ?? EdgeInsets.fromLTRB(32.w, 2.h, 0, 2.h),
      leading: leading,
      horizontalTitleGap: 6.w,
      title: Text(
        title,
        style: context.textStyles.medium.copyWith(
          color: context.colors.primary,
          fontSize: 18.sp,
        ),
      ),
      onTap: onTap,
    );
  }
}
