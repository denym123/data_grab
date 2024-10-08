import 'package:flutter/material.dart';

import '../../core.dart';

class MormacoIllustration extends StatelessWidget {
  final double? height;
  final AlignmentGeometry alignment;
  final BoxFit fit;
  const MormacoIllustration({
    super.key,
    this.height,
    this.alignment = Alignment.center,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.illustrationBg,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: const AssetImage(Assets.imagesIllustrationResized),
            fit: fit,
            alignment: alignment,
          ),
        ),
      ),
    );
  }
}
