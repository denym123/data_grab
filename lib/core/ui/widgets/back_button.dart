import 'package:flutter/material.dart';

import '../../core.dart';

class PrimaryBackButton extends StatelessWidget {
  const PrimaryBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 41.w,
      height: 41.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(width: 1, color: context.colors.dark4)),
      child: BackButton(
        color: context.colors.dark,
      ),
    );
  }
}
