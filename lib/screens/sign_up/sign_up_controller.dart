import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:plane_vite/screens/sign_up/sign_up_service.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../models/user.dart';
import '../../widgets/loader_screen.dart';
import 'dart:developer';

import '../Drawer/drawer_controller.dart';

class SignupController extends GetxController {
  var name;
  var email;
  var password;
  var confirmPassword;
  var passwordBool;
  var confirmPasswordBool;
  var phoneNumber;
  bool signupStatus = false;
  var message;
  var encodedImage='';
  var imageName='';
  var fileBool;

  late SignupService _service = SignupService();


  @override
  void onInit() {
    name = '';
    email = '';
    password = '';
    confirmPassword = '';
    phoneNumber = '';
    passwordBool = true.obs;
    confirmPasswordBool = true.obs;
    fileBool=false.obs;
    _service=SignupService();
    super.onInit();
  }

  void PickFile(){
    fileBool.value=true;
  }

  void securePassword() {
    passwordBool.value = !passwordBool.value;
  }

  void secureConfirmPassword() {
    confirmPasswordBool.value = !confirmPasswordBool.value;
  }

  Future<void> registerOnClick() async {

    User user = User(
        encodedImage: encodedImage,
        imageName: imageName,
        userName: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phoneNumber: phoneNumber
    );

    signupStatus = await _service.register(user);


/*
    if(message is List){
      String temp ='';
      for(String s in message)temp += s + '\n';
      message=temp;
    }*/
  }

  void onButtonTap(BuildContext context) async {

    loaderBoxGet(context);
    await registerOnClick();
    message = _service.message;
    Get.back();

    if (signupStatus) {
      Get.lazyPut(() => MyDrawerController());
      Get.offAllNamed('/skeleton');
      //EasyLoading.showSuccess(message);
    }
    else {
      errorMessageBoxGet(message,context);
      log('error here');
    }
  }
}
