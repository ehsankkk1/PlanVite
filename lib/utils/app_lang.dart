import 'dart:ui';

import 'package:get/get.dart';
import 'package:plane_vite/utils/local_storage.dart';

class AppLanguage extends GetxController{
var appLocale = 'en';
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    LocalStorageGet localStorageGet =  LocalStorageGet();
   appLocale= (await localStorageGet.languageSelected)!;
   Get.updateLocale(Locale(appLocale));
   update();
  }

  void changLanguage(String type)async{

    LocalStorageGet localStorageGet =  LocalStorageGet();
    if(appLocale==type){
      return;
    }
    if(type=='ar'){
      appLocale='ar';
      localStorageGet.saveLanguageToDisk('ar');
    }
    else{
      appLocale='en';
      localStorageGet.saveLanguageToDisk('en');
    }
    update();
  }
}