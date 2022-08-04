import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plane_vite/constants.dart';
import '../../models/user.dart';
import '../../widgets/loader_screen.dart';
import '../Drawer/drawer_controller.dart';
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

  void onButtonLogin(BuildContext context) async {

    loaderBoxGet (context);
    await loginOnClick();
    Get.back();
    if (loginStatus) {
      Get.lazyPut(() => MyDrawerController());
      Get.offAllNamed('/skeleton');
    } else {
      errorMessageBoxGet(message,context);
      log('error here');

    }
  }
}
