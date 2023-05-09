import 'package:flutter/material.dart';

import 'colors.dart';

TextStyle headerTextStyle() {
  return const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
}

class KTextStyle {
  static const balance =
      TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700);
  static const smallButton =
      TextStyle(color: AppColors.textOnWhite, fontSize: 25);
  static const bigTile = TextStyle(
      color: AppColors.titleOnWhite, fontSize: 40, fontWeight: FontWeight.w700);
  static const appName = TextStyle(
      color: Colors.white, fontSize: 70, fontWeight: FontWeight.w200);
  static const address = TextStyle(color: AppColors.titleOnWhite, fontSize: 25);
  static const label = TextStyle(
      color: AppColors.titleOnWhite, fontSize: 30, fontWeight: FontWeight.w500);
  static const tinyButton =
  TextStyle(color: AppColors.textOnWhite, fontSize: 15);
}
