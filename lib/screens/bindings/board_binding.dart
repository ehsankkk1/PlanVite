import 'package:get/get.dart';

import '../board/sprint_controller.dart';



class SprintBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<SprintController>(SprintController());
  }

}