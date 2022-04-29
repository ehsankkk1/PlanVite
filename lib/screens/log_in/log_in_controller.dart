import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';



class LoginController extends GetxController{

  var selectedLang;
  var  selectedLangBool ;


  @override
  void onInit() {
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
