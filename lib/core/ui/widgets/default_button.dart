import 'package:data_grab/core/core.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color backgroundColor;
  final Color? foregroundColor;

  const DefaultButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.icon,
      required this.backgroundColor,
      this.foregroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.w),
        ),
        minimumSize: Size(0, 48.h),
      ),
      onPressed: () {},
      child: Row(
        children: [
          Text(label),
          SizedBox(width: 8.w),
          Icon(icon ?? Icons.add),
        ],
      ),
    );
  }
}
