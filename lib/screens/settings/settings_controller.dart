import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plane_vite/config/theme_service.dart';
import 'package:plane_vite/config/themes2.dart';
import 'package:plane_vite/constants.dart';
import 'dart:ui';
import '../../storage/secure_storage.dart';
import '../../utils/local_storage.dart';

class SettingsController extends GetxController{

 // SecureStorage storage = SecureStorage();
  var isVisibleLang;
  var isVisibleTheme;
  var isPink;
  var isDark;
  var lang;
  var selectedLang;
  var isBlue;
  var isPurple;

  final box = GetStorage();
  @override
  void onInit() async{
    isVisibleLang = false.obs;
    isVisibleTheme = false.obs;
    isPink = box.read('isPink2')==true?true.obs:false.obs;
    isDark = box.read('isDark2')==true?true.obs:false.obs;
    isBlue = box.read('isBlue2')==true?true.obs:false.obs;
    isPurple= box.read('isPurple')==true?true.obs:false.obs;
    selectedLang=Get.locale.toString();
    lang=Get.locale.toString().obs;

print(box.read('isDark2'));





    super.onInit();

  }

  void storeThemeSetting1( isDark2) {
    box.write('isDark2', isDark2);
  }
  void storeThemeSetting( isPink2) {
    box.write('isPink2', isPink2);
  }
  void storeThemeSetting2( isPurple2) {
    box.write('isPurple2', isPurple2);
  }
  void storeThemeSetting3( isBlue2) {
    box.write('isBlue2', isBlue2);
  }
  changeToDark(){
    isPink.value = false;
    isDark.value = true;
    isBlue.value = false;
    isPurple.value=false;

  }
  changeToPink(){
    isDark.value = false;
    isPink.value = true;
    isBlue.value = false;
    isPurple.value=false;

  }
  changeToBlue(){
    isDark.value = false;
    isPink.value = false;
    isBlue.value = true;
    isPurple.value=false;

  }
  changeToPurple(){
    isPurple.value=true;
    isDark.value = false;
    isPink.value = false;
    isBlue.value = false;

  }
  changeToAr(){
    lang.value='ar';
  }
  changeToEn(){
    lang.value='en';
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