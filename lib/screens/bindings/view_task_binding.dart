import 'package:get/get.dart';

import '../view_task/view_task_controller.dart';





class ViewTaskBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<ViewTaskController>(ViewTaskController());
  }

}