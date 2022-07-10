import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/config/themes.dart';
import 'package:plane_vite/constants.dart';

import '../../storage/secure_storage.dart';

class SettingsController extends GetxController{

  SecureStorage storage = SecureStorage();
  var isVisibleLang;
  var isVisibleTheme;
  var isPink;
  var isDark;


  @override
  void onInit() {
    isVisibleLang = false.obs;
    isVisibleTheme = false.obs;
    isPink = true.obs;
    isDark = Themes.theme==''?false.obs:true.obs;




    super.onInit();
  }
  changeThemeToDark(){

    kBackGround.value=Color(0xFF3F4E4F);
    kDrawerBackGround.value=Color(0xFF2C3639);
    kWritings.value=Color(0xFF787A91);
    kMainPink.value=Color(0xFF506D84);
    kLightPink.value=Color(0xFF889EAF);
    kColoredCard.value=Color(0xFF515E63);

    Themes.theme='dark';
    saveTheme();

  }
  saveTheme ()async{
   await storage.save('theme', Themes.theme);
    print(storage.read('theme'));
  }

}