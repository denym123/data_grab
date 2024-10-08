import 'package:flutter/material.dart';

import '../../core.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  const RoundedButton({super.key, this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          color: context.colors.dark4,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
