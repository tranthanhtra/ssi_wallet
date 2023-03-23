import 'package:flutter/material.dart';
import 'package:get/get.dart';

double designWidth = 360;
double designHeight = 640;

double screenWidth() {
  return MediaQuery.of(Get.context!).size.width;
}

double screenHeight() {
  return MediaQuery.of(Get.context!).size.height;
}

double getWidth(double width) {
  return width * screenWidth() / designWidth;
}

double getHeight(double height) {
  return height * screenHeight() / designHeight;
}