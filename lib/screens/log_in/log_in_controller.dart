import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';



class LoginController extends GetxController{

  var selectedLang;
  var selectedLangBool ;
  var email;
  var password;
  var passwordBool;

  @override
  void onInit() {
    email='';
    password='';
    selectedLang='en';
    selectedLangBool = true.obs;
    passwordBool=true.obs;

    super.onInit();
  }
  void securePassword(){
    passwordBool.value=!passwordBool.value;
  }


  void changeSelectedLang(){
    if(selectedLang=='ar'){
      selectedLangBool.value=false;
    }
    else{
      selectedLangBool.value=true;
    }
  }


}
