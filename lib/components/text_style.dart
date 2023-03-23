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
  static const listTitleTextStyle = TextStyle(
      color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500);

  static const textFieldHeading =
  TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500);

  static const sectionTitle = TextStyle(
      color: Colors.black, fontSize: 28, fontWeight: FontWeight.w700);

  static const buttonStyle = TextStyle(
      color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700);

  static const previewTitleStyle = TextStyle(
      color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700);

  static const normalStyle =
  TextStyle(
      color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400);
}