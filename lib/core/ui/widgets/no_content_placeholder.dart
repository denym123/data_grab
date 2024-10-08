import 'package:flutter/material.dart';

import '../../core.dart';

class NoItemPlaceholder extends StatelessWidget {
  final String label;
  final String imageUrl;
  final String? hint;

  const NoItemPlaceholder(
      {super.key, required this.label, required this.imageUrl, this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          scale: 3.0,
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: context.textStyles.bold.copyWith(
            color: context.colors.primary,
          ),
        ),
        if (hint != null) ...[
          Text(
            hint!,
            style: context.textStyles.semiBold,
            textAlign: TextAlign.center,
          ),
        ]
      ],
    );
  }
}
