import 'package:get/get.dart';



class LoginController extends GetxController{



  var selectedLang;
  var  selectedLangBool ;
  var email;



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
