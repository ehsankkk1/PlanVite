import 'package:get/get.dart';

import '../splash/welcome_controller.dart';


class WelcomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<WelcomeController>(WelcomeController());
  }

}