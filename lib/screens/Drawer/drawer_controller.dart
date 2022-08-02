
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:plane_vite/screens/Drawer/drawer_model.dart';

import '../sprint/sprint_controller.dart';
import 'drawer_service.dart';

class MyDrawerController extends GetxController {
  ZoomDrawerController zoomDrawerController = ZoomDrawerController();


  var isLoading=false.obs;
  List<Projects> allProjects=[];
  @override
  Future<void> onInit() async {

    DrawerServices _drawerServices=DrawerServices();
    allProjects = await _drawerServices.getProjects();
    isLoading.value = true;
    super.onInit();
  }

  void toggleDrawer() {
    print("Toggle drawer");
    zoomDrawerController.toggle?.call();
    update();
  }
  void kickDrawer(){
    zoomDrawerController.close?.call();
    update();
  }
}
