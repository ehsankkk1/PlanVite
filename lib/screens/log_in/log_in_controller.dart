import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';



class LoginController extends GetxController{

  var selectedLang;
  var  selectedLangBool ;
  double width=0;
  double height=0;
  late BuildContext context;
  int num=0.abs();


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
