// ignore_for_file: deprecated_member_use

import 'package:gestao_velas/ds/tokens/ds_icons_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DsIcon extends StatelessWidget {
  final DsIconToken icon;
  final double? size;
  final Color? color;
  const DsIcon({super.key, required this.icon, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(icon.svg, width: size, height: size, color: color);
  }
}
