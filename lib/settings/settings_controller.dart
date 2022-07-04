import 'package:get/get.dart';

class SettingsController extends GetxController{


  var isVisibleLang;
  var isVisibleTheme;

  @override
  void onInit() {
    isVisibleLang = false.obs;
    isVisibleTheme = false.obs;
    super.onInit();
  }

}