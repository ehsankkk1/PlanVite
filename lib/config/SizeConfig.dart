import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeConfig {
  static double screenWidth=Get.width;
  static double screenHeight=Get.height;
  static double blockSizeHorizontal=0;
  static double blockSizeVertical=0;

  void init(BuildContext context) {

    screenWidth = context.width;
    screenHeight = context.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}