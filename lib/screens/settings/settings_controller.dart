import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/config/theme_service.dart';
import 'package:plane_vite/config/themes2.dart';
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
    isDark = false.obs;
    String str = ThemeService().theme.toString();
    print(str);




    super.onInit();
  }
  changeToDark(){
    isPink.value = false;
    isDark.value = true;

  }
  changeToPink(){
    isDark.value = false;
    isPink.value = true;

  }
  changeThemeToDark(){

    // kBackGround.value=Color(0xFF3F4E4F);
    // kDrawerBackGround.value=Color(0xFF2C3639);
    // kWritings.value=Color(0xFF787A91);
    // kMainPink.value=Color(0xFF506D84);
    // kLightPink.value=Color(0xFF889EAF);
    // kColoredCard.value=Color(0xFF515E63);

    //Themes.theme='dark';
   // saveTheme();

  }
  changeThemeToPink(){

    // kBackGround.value=Color(0xFFFCF8F3);
    // kDrawerBackGround.value=Colors.white;
    // kWritings.value=Color(0xFF698474);
    // kMainPink.value=Color(0xFFFFAAA5);
    // kLightPink.value=Color(0xFFFFDFEC);
    // kColoredCard.value=Color(0xFFFDE3E1);

    //Themes.theme='pink';
   // saveTheme();

  }
  //saveTheme (){
   //  storage.save('theme', Themes.theme);
   //  storage.read('theme').then((result) {
   //    Themes.theme=result!;
   //  } );
   //  print(Themes.theme);
  //}

}