import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/user.dart';
import 'log_in_service.dart';



class LoginController extends GetxController{

  var selectedLang;
  var selectedLangBool ;
  var email;
  var password;
  var passwordBool;
  var checkBoxStatus;
  var loginStatus;
  var message;
  late LoginService service=LoginService();


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
    service=LoginService();

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

    loginStatus = await service.login(user,checkBoxStatus.value);
    message=service.message;

    if(message is List){
      String temp ='';
      for(String s in message)temp += s + '\n';
      message=temp;


    }
  }


}
