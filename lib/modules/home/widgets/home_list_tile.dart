import 'package:data_grab/core/core.dart';
import 'package:flutter/material.dart';

class HomeListTile extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final String subTitle;
  final int dependentNumber;

  const HomeListTile(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.subTitle,
      required this.dependentNumber});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 48.h),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.w),
          side: BorderSide(
            color: context.colors.primary,
            width: 2.r,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Column(
            children: [
              Text(
                title,
                style: context.textStyles.bold,
              ),
              Text(subTitle),
            ],
          ),
          Text(
            "${dependentNumber ?? ""}",
          )
        ],
      ),
    );
  }
}
