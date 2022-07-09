import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:plane_vite/screens/sign_up/sign_up_service.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../models/user.dart';
import '../../widgets/loader_screen.dart';
import 'dart:developer';

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
        phoneNumber: phoneNumber);

    //print(encodedImage);
    signupStatus = await _service.register(user);


/*    message=_service.message;
    if(message is List){
      String temp ='';
      for(String s in message)temp += s + '\n';
      message=temp;
    }*/
  }

  void onButtonTap() async {
    Get.defaultDialog(
        title: 'Loading...',
        titleStyle: TextStyle(color: kWritings.value,fontSize: 25),
        content: LoaderScreen(),
        backgroundColor: kBackGround.value
    );
    await registerOnClick();
    Get.back();
    /*    EasyLoading.show(
      status: 'Loading...',
      dismissOnTap: true,

    );*/
    if (signupStatus) {
      Get.offAllNamed('/skeleton');
      //EasyLoading.showSuccess(message);
    } else {
      Get.defaultDialog(
          title: message,
          titleStyle: TextStyle(color: kWritings.value,fontSize: 25),
          content: LoaderScreen(error: true,),
          backgroundColor: kBackGround.value
      );
      log('error here');
      /*      EasyLoading.showError(
        message,
        duration: const Duration(seconds: 10),
        dismissOnTap: true,
      );*/

    }
  }
}
