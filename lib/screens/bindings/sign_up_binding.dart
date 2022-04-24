import 'package:get/get.dart';

import '../sign_up/sign_up_controller.dart';

class SignupBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<SignupController>(SignupController());
  }

}