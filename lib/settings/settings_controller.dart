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

    kBackGround.value=Color(0xFF0E050F);
    kDrawerBackGround.value=Colors.black;
  }

}