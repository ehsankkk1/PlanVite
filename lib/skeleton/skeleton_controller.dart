import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plane_vite/config/themes.dart';
import 'package:plane_vite/storage/secure_storage.dart';
import '../screens/Drawer/drawer_controller.dart';
import '../screens/back_log/back_log_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/sprint/sprint_screen.dart';

class SkeletonController extends GetxController{
SecureStorage storage=new SecureStorage();

 // var selectedLang;
 // var  selectedLangBool ;
  RxInt screenIndex=0.obs ;
  var isReverse=false.obs;
  late final List<Widget> Screens;
  final MyDrawerController _myDrawerController = Get.find();

  @override
  void onInit() {
    //selectedLang='en';
   // selectedLangBool = true.obs;
    getData();
    print('jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj');
    print(Themes.theme);
    Screens = [
      HomeScreen(),
      SprintScreen(),
    ];
    super.onInit();

  }
  getData()async{
    print(Themes.theme);
      Themes.theme= storage.read('theme').toString();


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
