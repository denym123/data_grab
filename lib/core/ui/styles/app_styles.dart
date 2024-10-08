import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core.dart';

class AppStyles {
  static AppStyles? _instance;

  AppStyles._();

  static AppStyles get i {
    _instance ??= AppStyles._();
    return _instance!;
  }

  TextButtonThemeData get textButtonTheme => TextButtonThemeData(
        style: TextButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        ),
      );

  InputDecoration get procedureTextDecoration => InputDecoration(
        hintStyle: TextStyles.i.regular.copyWith(
          color: AppColors.i.dark4,
          fontSize: ScreenUtil().setSp(16),
        ),
        errorStyle: TextStyles.i.medium.copyWith(
          color: AppColors.i.orange,
          fontSize: ScreenUtil().setSp(12),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenUtil().radius(8)),
          borderSide: BorderSide(
            color: AppColors.i.dark4,
          ),
        ),
      );

  ElevatedButtonThemeData get primaryButton => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          textStyle: TextStyles.i.bold16,
          backgroundColor: AppColors.i.primary,
          foregroundColor: Colors.white,
          padding: EdgeInsets.fromLTRB(
              0, ScreenUtil().setHeight(18), 0, ScreenUtil().setHeight(18)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ScreenUtil().radius(12)),
          ),
        ),
      );

  ElevatedButtonThemeData get loginButton => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          textStyle: TextStyles.i.medium.copyWith(
            fontSize: ScreenUtil().setSp(16),
            fontWeight: FontWeight.w800,
          ),
          backgroundColor: AppColors.i.illustrationBg,
          minimumSize: Size(double.infinity, ScreenUtil().setHeight(60)),
          foregroundColor: Colors.white,
          padding: EdgeInsets.fromLTRB(
              0, ScreenUtil().setHeight(18), 0, ScreenUtil().setHeight(18)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ScreenUtil().radius(12),
            ),
            side: BorderSide(
              width: ScreenUtil().setWidth(1),
              color: Colors.white,
            ),
          ),
        ),
      );

  ElevatedButtonThemeData get hollowButton => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          textStyle: TextStyles.i.bold16,
          foregroundColor: AppColors.i.dark,
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.fromLTRB(
              0, ScreenUtil().setHeight(18), 0, ScreenUtil().setHeight(18)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ScreenUtil().radius(12),
            ),
            side: BorderSide(
              width: ScreenUtil().setWidth(1),
              color: AppColors.i.dark,
            ),
          ),
        ),
      );

  InputDecoration datePickerDecoration({
    required TextEditingController controller,
    required String? hint,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyles.i.regular.copyWith(
        color: AppColors.i.dark4,
        fontSize: ScreenUtil().setSp(16),
      ),
      prefixIcon: Icon(
        Icons.calendar_month_sharp,
        size: ScreenUtil().setSp(16),
        color: AppColors.i.dark4,
      ),
      suffixIcon: IconButton(
        icon: Icon(
          Icons.close,
          size: ScreenUtil().setSp(16),
          color: AppColors.i.dark4,
        ),
        onPressed: () {
          controller.clear();
        },
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(16),
        vertical: ScreenUtil().setHeight(16),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ScreenUtil().radius(8)),
        borderSide: BorderSide(
          color: AppColors.i.dark4,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(ScreenUtil().radius(8)),
        borderSide: BorderSide(
          color: AppColors.i.dark4,
        ),
      ),
    );
  }

  AppBarTheme get appBarTheme => AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.i.primary,
      );

  BoxDecoration get verificationPinPut => BoxDecoration(
      borderRadius: BorderRadius.circular(
        ScreenUtil().radius(8),
      ),
      color: Colors.white,
      border: Border.all(
        color: AppColors.i.primary,
      ));
}

extension AppStylesExtension on BuildContext {
  AppStyles get styles => AppStyles.i;
}
