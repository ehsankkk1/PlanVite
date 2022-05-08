import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../constants.dart';

class BoardController extends GetxController{


  var selectedLang;
  var  selectedLangBool ;
  final key1=GlobalKey();

  @override
  void onInit() {
    selectedLang='en';
    selectedLangBool = true.obs;

    super.onInit();

  }

  void changeSelectedLang()async{
    if(selectedLang=='ar'){
      selectedLangBool.value=false;
    }
    else{
      selectedLangBool.value=true;
    }
  }



}
