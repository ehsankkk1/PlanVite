import 'package:get/get.dart';
import 'package:plane_vite/screens/sign_up/sign_up_service.dart';

import '../../models/user.dart';

class SignupController extends GetxController {
  var name;
  var email;
  var password;
  var confirmPassword;
  var passwordBool;
  var confirmPasswordBool;
  var phoneNumber;
  var signupStatus = false;
  var message;
  var encodedImage='';
  var imageName='';

  SignupService service = SignupService();


  @override
  void onInit() {
    name = '';
    email = '';
    password = '';
    confirmPassword = '';
    phoneNumber = '';
    passwordBool = true.obs;
    confirmPasswordBool = true.obs;
    super.onInit();
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
    print('jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj');
    print(encodedImage);
    signupStatus = await service.register(user);
    message=service.message;

    if(message is List){
      String temp ='';
      for(String s in message)temp += s + '\n';
      message=temp;


    }
  }
}
