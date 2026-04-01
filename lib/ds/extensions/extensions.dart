import 'package:gestao_velas/ds/tokens/ds_app_colors.dart';
import 'package:flutter/material.dart';

extension AppColorsX on BuildContext {
  DsAppColors get colors => Theme.of(this).extension<DsAppColors>()!;
}
