import 'package:get/get.dart';



class LoginController extends GetxController{



  var selectedLang;
  var selectedLangBool;




  @override
  void onInit() {
    selectedLang='en';
    selectedLangBool = true.obs;

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
