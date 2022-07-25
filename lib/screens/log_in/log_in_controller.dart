import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plane_vite/constants.dart';
import '../../models/user.dart';
import '../../widgets/loader_screen.dart';
import 'log_in_service.dart';
import 'dart:developer';


class LoginController extends GetxController{

  var selectedLang;
  var selectedLangBool ;
  var email;
  var password;
  var passwordBool;
  var checkBoxStatus;
  bool loginStatus = false;
  var message;
  late LoginService _service=LoginService();


  @override
  void onInit() {
    email='';
    password='';
    selectedLang='en';
    selectedLangBool = true.obs;
    passwordBool=true.obs;
    checkBoxStatus=false.obs;
    loginStatus=false;
    message='';
    _service=LoginService();

    super.onInit();
  }
  void securePassword(){
    passwordBool.value=!passwordBool.value;
  }


  void changeSelectedLang(){
    if(selectedLang=='ar'){
      selectedLangBool.value=false;
    }
    else{
      selectedLangBool.value=true;
    }
  }
  void changeCheckBoxStatus()async{

    checkBoxStatus(! (checkBoxStatus.value));

  }

  Future<void> loginOnClick() async {
    User user = User(
      email: email,
      password: password,
    );

    loginStatus = await _service.login(user,checkBoxStatus.value);
    message=_service.message;

    if(message is List){
      String temp ='';
      for(String s in message)temp += s + '\n';
      message=temp;
    }
  }

  void onButtonLogin() async {
/*    EasyLoading.show(
      status: 'Loading...',
    );*/
    Get.defaultDialog(
        title: 'Loading...',
        titleStyle: TextStyle(color: kWritings.value,fontSize: 25),
        content: LoaderScreen(),
        backgroundColor: kBackGround.value
    );
    await loginOnClick();
    Get.back();
    if (loginStatus) {
      Get.offAllNamed('/skeleton');
     // EasyLoading.dismiss(animation: true);
      //Get.offNamed('/login');
      //EasyLoading.showSuccess(message);
    } else {
      Get.defaultDialog(
          title: message,
          titleStyle: TextStyle(color: kWritings.value,fontSize: 25),
          content: LoaderScreen(error: true,),
          backgroundColor: kBackGround.value
      );
     /* EasyLoading.showError(
        message,
        duration: const Duration(seconds: 10),
        dismissOnTap: true,
      );*/
      log('error here');

    }
  }
}
