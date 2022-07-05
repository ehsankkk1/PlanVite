import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/constants.dart';

class SettingsController extends GetxController{


  var isVisibleLang;
  var isVisibleTheme;
  var isPink;
  var isDark;


  @override
  void onInit() {
    isVisibleLang = false.obs;
    isVisibleTheme = false.obs;
    isPink = true.obs;
    isDark = false.obs;

    super.onInit();
  }
  changeThemeToDark(){

    kBackGround.value=Color(0xFF3F4E4F);
    kDrawerBackGround.value=Color(0xFF2C3639);
    kWritings.value=Color(0xFF787A91);
  }

}