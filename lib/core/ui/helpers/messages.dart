import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

import '../../core.dart';

class Messages {
  Messages._();

  static void alert(String message) {
    Grock.snackBar(
      opacity: 1,
      duration: const Duration(seconds: 8),
      leadingPadding: EdgeInsets.fromLTRB(16.w, 25.h, 16.w, 25.h),
      title: "Atencão!",
      titleStyle: TextStyles.i.semiBold.copyWith(
        fontSize: 16.sp,
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(8.r),
      description: message,
      descriptionStyle: TextStyles.i.regular.copyWith(
        fontSize: 14.sp,
        color: const Color(0XFFC8C5C5),
      ),
      color: const Color(0XFF242C32),
    );
  }

  static void error(String message) {
    Grock.snackBar(
      opacity: 1,
      duration: const Duration(seconds: 8),
      leadingPadding: EdgeInsets.fromLTRB(16.w, 25.h, 16.w, 25.h),
      title: "Erro!",
      titleStyle: TextStyles.i.semiBold.copyWith(
        fontSize: 16.sp,
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(8.r),
      description: message,
      descriptionStyle: TextStyles.i.regular.copyWith(
        fontSize: 14.sp,
        color: const Color(0XFFC8C5C5),
      ),
      color: const Color(0XFF242C32),
    );
  }

  static void success(String message) {
    Grock.snackBar(
      opacity: 1,
      duration: const Duration(seconds: 8),
      leadingPadding: EdgeInsets.fromLTRB(16.w, 25.h, 16.w, 25.h),
      title: "Sucesso!",
      titleStyle: TextStyles.i.semiBold.copyWith(
        fontSize: 16.sp,
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(8.r),
      description: message,
      descriptionStyle: TextStyles.i.regular.copyWith(
        fontSize: 14.sp,
        color: const Color(0XFFC8C5C5),
      ),
      color: const Color(0XFF242C32),
    );
  }
}
