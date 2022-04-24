import 'package:get/get.dart';
import 'package:plane_vite/screens/log_in/log_in_controller.dart';

class LoginBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }

}