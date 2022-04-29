import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';



class LoginController extends GetxController{

  var selectedLang;
  var selectedLangBool ;
  var email;
  var password;

  @override
  void onInit() {
    email='';
    password='';
    selectedLang='en';
    selectedLangBool = true.obs;

    super.onInit();

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
