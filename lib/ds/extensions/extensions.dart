import 'package:gestao_velas/ds/tokens/app_colors.dart';
import 'package:flutter/material.dart';

extension AppColorsX on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
}
