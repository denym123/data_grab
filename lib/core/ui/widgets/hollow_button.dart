import 'package:flutter/material.dart';

import '../../core.dart';

class HollowButton extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final String label;
  const HollowButton(
      {super.key,
      this.width,
      this.height,
      this.onPressed,
      this.style,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style ??
          context.styles.hollowButton.style?.copyWith(
            minimumSize: WidgetStateProperty.all<Size>(
              Size(width ?? double.infinity, height ?? 64.h),
            ),
          ),
      child: Text(label),
    );
  }
}
