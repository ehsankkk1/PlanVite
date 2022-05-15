import 'package:get/get.dart';
import '../task/task_controller.dart';




class TaskBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<TaskController>(TaskController());
  }

}