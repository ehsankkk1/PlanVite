
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../sprint/sprint_controller.dart';

class MyDrawerController extends GetxController {
  ZoomDrawerController zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    zoomDrawerController.close?.call();
    print("Toggle drawer");
    zoomDrawerController.toggle?.call();
    update();
  }
}
