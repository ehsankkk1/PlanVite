import 'package:get/get.dart';
import 'package:plane_vite/screens/home/home_controller.dart';


class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }

}