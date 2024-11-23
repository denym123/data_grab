import 'package:data_grab/core/core.dart';
import 'package:flutter/material.dart';

class DependentTile extends StatelessWidget {
  final String? title;
  final String? document;
  final String? birthdate;

  const DependentTile({
    super.key,
   required this.title,
   required this.document,
   required this.birthdate,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),

      ),
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: context.colors.primary,
            width: 2.w,
          ),
        ),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Row(
            children: [
              Icon(
                Icons.person,
                color: context.colors.primary,
                size: 60.r,
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? '',
                      style: context.textStyles.semiBold16.copyWith(
                        color: context.colors.primary,
                      ),
                    ),
                    Text(
                      document ?? '',
                      style: context.textStyles.medium.copyWith(
                        color: context.colors.dark2,
                      ),
                    ),
                    Text(
                      birthdate ?? '',
                      style: context.textStyles.medium.copyWith(
                        color: context.colors.dark2,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
