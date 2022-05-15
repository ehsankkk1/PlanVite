import 'package:get/get.dart';


class TaskController extends GetxController{


  var selectedLang;
  var  selectedLangBool ;

  @override
  void onInit() {
    selectedLang='en';
    selectedLangBool = true.obs;
    super.onInit();

  }

  void changeSelectedLang()async{
    if(selectedLang=='en'){
      selectedLangBool.value=false;
    }
    else{
      selectedLangBool.value=true;
    }
  }


}
