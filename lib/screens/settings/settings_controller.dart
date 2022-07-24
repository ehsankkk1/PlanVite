import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plane_vite/config/theme_service.dart';
import 'package:plane_vite/config/themes2.dart';
import 'package:plane_vite/constants.dart';
import 'package:plane_vite/screens/settings/settings_service.dart';
import 'dart:ui';
import '../../config/user_information.dart';
import '../../storage/secure_storage.dart';
import '../../utils/local_storage.dart';

class SettingsController extends GetxController{

 // SecureStorage storage = SecureStorage();
  var isVisibleLang;
  var isVisibleTheme;
  var isPink;
  var isDark;
  var message;
  //var lang;
 // var selectedLang;
  var isBlue;
  var isPurple;
  var isAr;
  var isEn;
  var logOutStatus ;
  final box = GetStorage();
  late SettingsService service=SettingsService();
  @override
  void onInit() async{
    isVisibleLang = false.obs;
    isVisibleTheme = false.obs;
    isPink = box.read('isPink2')==true?true.obs:false.obs;
    isDark = box.read('isDark2')==true?true.obs:false.obs;
    isBlue = box.read('isBlue2')==true?true.obs:false.obs;
    isPurple= box.read('isPurple')==true?true.obs:false.obs;
    isAr=box.read('isAr2')==true?true.obs:false.obs;
    logOutStatus=false;
    message='';
    //selectedLang=Get.locale.toString();
    //lang=Get.locale.toString().obs;







    super.onInit();

  }
  void storeThemeSetting( isPink2) {
    box.write('isPink2', isPink2);
  }
  void storeThemeSetting1( isDark2) {
    box.write('isDark2', isDark2);
  }
  void storeThemeSetting2( isPurple2) {
    box.write('isPurple2', isPurple2);
  }
  void storeThemeSetting3( isBlue2) {
    box.write('isBlue2', isBlue2);
  }
  void storeLangAr(isAr2){
    box.write('isAr2', isAr2);
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
  changeToEn(){
    isAr.value=false;
  }
  changeToAr(){
    isAr.value=true;
  }


  Future<void> logOutOnClick() async {




    logOutStatus = await service.logout(UserInformation.User_Token);
    message=service.message;
    if(message is List){
      String temp ='';
      for(String s in message)temp += s + '\n';
      message=temp;


    }
  }



}