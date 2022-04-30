import 'package:get/get.dart';



class SignupController extends GetxController{

var name ;
var email;
var password;
var confirmPassword;
var passwordBool;
var confirmPasswordBool;







@override
  void onInit() {
  name='';
  email='';
  password='';
  confirmPassword='';
  passwordBool=true.obs;
  confirmPasswordBool=true.obs;
    super.onInit();
  }
void securePassword(){
  passwordBool.value=!passwordBool.value;
}
void secureConfirmPassword(){
  confirmPasswordBool.value=!confirmPasswordBool.value;
}



}