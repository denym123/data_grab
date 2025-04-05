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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Responsável: ",
                style: context.textStyles.medium.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                responsibleName ?? "",
                style: context.textStyles.medium,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Documento: ",
                style: context.textStyles.medium.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                responsibleDocument ?? "",
                style: context.textStyles.medium,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Quantidade de dependentes: ",
                style: context.textStyles.medium.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                personNumber ?? "",
                style: context.textStyles.medium,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Data de criação: ",
                style: context.textStyles.regular,
              ),
              Text(
                responsibleName ?? "",
                style: context.textStyles.regular,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
