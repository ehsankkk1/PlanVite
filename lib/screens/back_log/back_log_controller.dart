import 'package:get/get.dart';

import '../Drawer/drawer_controller.dart';



class BackLogController extends GetxController{


  var selectedLang;
  var  selectedLangBool ;
  var rating=0.obs;



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
