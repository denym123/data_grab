import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;

  AppColors._();

  static AppColors get i {
    _instance ??= AppColors._();
    return _instance!;
  }

  //Primary
  Color get primary => const Color(0xFF1175B8);

  Color get primaryDark => const Color(0xff0e67a1);

  Color get primaryLight => const Color(0xFF2391DF);

  Color get primaryLight2 => const Color(0xFF244EBA);

  //Secondary
  Color get error => const Color(0xFFDF1E1E);

  Color get errorDark => const Color(0xFFAD0E0E);

  Color get errorLight => const Color(0xFFFF5C5C);

  Color get errorLight2 => const Color(0xFFFF8080);

  Color get orange => const Color(0xFFE8400C);

  Color get orangeDark => const Color(0xFFA9320C);

  Color get orangeLight => const Color(0xFFFB5D2C);

  Color get orangeLight2 => const Color(0xFFFF784D);

  Color get yellow => const Color(0xFFF5CA14);

  Color get yellowDark => const Color(0xFFC9A50F);

  Color get yellowLight => const Color(0xFFFAD126);
  Color get yellowLight2 => const Color(0xFFFFE05C);

  Color get success => const Color(0xFF12B819);

  Color get successDark => const Color(0xFF0E7812);

  Color get successLight => const Color(0xFF4DC252);

  Color get successLight2 => const Color(0xFF8FE393);

  // Neutral

  Color get dark => const Color(0xFF262728);

  Color get dark2 => const Color(0xFF66686B);

  Color get dark3 => const Color(0xFF88888C);

  Color get dark4 => const Color(0xFFC7C9D9);

  // Bright

  Color get bright => const Color(0xFFDDE5E9);
  Color get bright2 => const Color(0xFFEBEBF0);
  Color get bright3 => const Color(0xFFF2F2F5);
  Color get bright4 => const Color(0xFFFAFAFC);

  // Label
  Color get darkLabel => const Color(0xFF02113C);
  Color get grayLabel => const Color(0xFF4E5876);

  // Custom
  Color get illustrationBg => const Color(0XFFFD8E28);
}

extension AppColorsExtension on BuildContext {
  AppColors get colors => AppColors.i;
}
