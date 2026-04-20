import 'package:flutter/material.dart';

class DsText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final double? height;
  final double? letterSpacing;
  final bool? underline;

  const DsText({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    this.height,
    this.letterSpacing,
    this.underline,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
        decoration: underline == true ? TextDecoration.underline : null,
      ),
    );
  }
}
