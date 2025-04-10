import 'package:data_grab/core/core.dart';
import 'package:flutter/material.dart';

class HomeListTile extends StatelessWidget {
  final VoidCallback onPressed;
  final String? responsibleName;
  final String? responsibleDocument;
  final String? personNumber;
  final String? createdAt;

  const HomeListTile({
    super.key,
    required this.onPressed,
    required this.responsibleName,
    required this.responsibleDocument,
    required this.personNumber,
    this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: context.textStyles.medium.copyWith(
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: "Responsável: ",
                  style: context.textStyles.medium.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                TextSpan(
                  text: responsibleName ?? "",
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          RichText(
            text: TextSpan(
              style: context.textStyles.medium.copyWith(
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: "Documento: ",
                  style: context.textStyles.medium.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                TextSpan(
                  text: responsibleDocument ?? "",
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          RichText(
            text: TextSpan(
              style: context.textStyles.medium.copyWith(
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: "Quantidade de dependentes: ",
                  style: context.textStyles.medium.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                TextSpan(
                  text: personNumber ?? "",
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          RichText(
            text: TextSpan(
              style: context.textStyles.medium.copyWith(
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: "Data de criação: ",
                  style: context.textStyles.medium.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                TextSpan(
                  text: createdAt ?? "",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
