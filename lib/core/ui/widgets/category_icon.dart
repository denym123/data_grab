import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class CategoryIcon extends StatelessWidget {
  final String categoryIconUrl;

  const CategoryIcon({super.key, required this.categoryIconUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: 37.h,
      placeholder: (context, _) {
        return DefaultShimmer(
          child: Container(
            height: 37.h,
            width: 37.h,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(
                100.r,
              ),
            ),
          ),
        );
      },
      imageUrl: categoryIconUrl,
      errorWidget: (context, url, error) {
        return Icon(
          Icons.account_circle_rounded,
          size: 37.h,
          color: context.colors.primary,
        );
      },
    );
  }
}
