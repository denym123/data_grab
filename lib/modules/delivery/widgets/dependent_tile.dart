import 'package:data_grab/core/core.dart';
import 'package:flutter/material.dart';

class DependentTile extends StatelessWidget {
  const DependentTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      color: context.colors.primary,
    );
  }
}
