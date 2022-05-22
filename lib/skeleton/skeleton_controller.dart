import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plane_vite/screens/back_log/back_log_controller.dart';
import 'package:plane_vite/screens/home/home_controller.dart';

import '../screens/Drawer/drawer_controller.dart';
import '../screens/back_log/back_log_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/sprint/sprint_controller.dart';
import '../screens/sprint/sprint_screen.dart';



class SkeletonController extends GetxController{


  var selectedLang;
  var  selectedLangBool ;
  int screenIndex=0;
  late  MyDrawerController myDrawerController = Get.find();

  final List<Widget> Screens = [
    HomeScreen(),
    SprintScreen(),
    BackLogScreen(),
  ];
  @override
  void onInit() {
    selectedLang='en';
    selectedLangBool = true.obs;
    Get. put(MyDrawerController());
    Get.put(SprintController());
    Get.put(HomeController());
    Get.put(BackLogController());
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
    screenIndex=index;
    update();
  }


}
