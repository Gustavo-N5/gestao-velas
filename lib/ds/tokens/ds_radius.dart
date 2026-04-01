import 'package:flutter/material.dart';

abstract class DSRadius {
  const DSRadius._();

  static const double _r0 = 0;
  static const double _r2 = 2;
  static const double _r4 = 4;
  static const double _r6 = 6;
  static const double _r8 = 8;
  static const double _r10 = 10;
  static const double _r12 = 12;
  static const double _r16 = 16;
  static const double _r20 = 20;
  static const double _r24 = 24;
  static const double _r28 = 28;
  static const double _full = 999;

  static BorderRadius get r0 => BorderRadius.circular(_r0);
  static BorderRadius get r2 => BorderRadius.circular(_r2);
  static BorderRadius get r4 => BorderRadius.circular(_r4);
  static BorderRadius get r6 => BorderRadius.circular(_r6);
  static BorderRadius get r8 => BorderRadius.circular(_r8);
  static BorderRadius get r10 => BorderRadius.circular(_r10);
  static BorderRadius get r12 => BorderRadius.circular(_r12);
  static BorderRadius get r16 => BorderRadius.circular(_r16);
  static BorderRadius get r20 => BorderRadius.circular(_r20);
  static BorderRadius get r24 => BorderRadius.circular(_r24);
  static BorderRadius get r28 => BorderRadius.circular(_r28);
  static BorderRadius get full => BorderRadius.circular(_full);
}
