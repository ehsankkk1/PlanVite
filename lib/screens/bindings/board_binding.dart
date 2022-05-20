import 'package:get/get.dart';
import 'package:plane_vite/screens/sprint/sprint_controller.dart';


class SprintBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<SprintController>(SprintController());
  }

}