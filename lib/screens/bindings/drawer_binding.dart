import 'package:get/get.dart';
import '../Drawer/drawer_controller.dart';


class DrawerBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<MyDrawerController>(MyDrawerController());
  }

}