import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  static TextStyles get i {
    _instance ??= TextStyles._();
    return _instance!;
  }

  TextStyle get bold => TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: ScreenUtil().setWidth(28.sp),
  );

  TextStyle get semiBold => TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: ScreenUtil().setWidth(24.sp),
  );

  TextStyle get bold16 => TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: ScreenUtil().setWidth(16.sp),
  );

  TextStyle get semiBold16 => TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: ScreenUtil().setWidth(16.sp),
  );

  TextStyle get medium => TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: ScreenUtil().setWidth(14.sp),
  );

  TextStyle get bold14 => TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: ScreenUtil().setWidth(14.sp),
  );

  TextStyle get medium12 => TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: ScreenUtil().setWidth(12.sp),
  );

  TextStyle get regular => TextStyle(
    fontSize: ScreenUtil().setWidth(12.sp),
  );

}

extension TextStylesExtension on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}