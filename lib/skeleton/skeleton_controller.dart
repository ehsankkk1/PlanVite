import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../screens/Drawer/drawer_controller.dart';
import '../screens/back_log/back_log_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/sprint/sprint_screen.dart';

class SkeletonController extends GetxController{


  var selectedLang;
  var  selectedLangBool ;
  RxInt screenIndex=0.obs ;
  var isReverse=false.obs;
  late final List<Widget> Screens;
  final MyDrawerController _myDrawerController = Get.find();

  @override
  void onInit() {
    selectedLang='en';
    selectedLangBool = true.obs;
    Screens = [
      HomeScreen(),
      SprintScreen(),
      BackLogScreen(),
    ];
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

  void changeScreen(int index) {
    print(screenIndex);
    if(index > screenIndex.value){
      isReverse.value = false;
    }
    else{
      isReverse.value = true;
    }
    _myDrawerController.kickDrawer();
    screenIndex.value=index;
    update();
  }


}
