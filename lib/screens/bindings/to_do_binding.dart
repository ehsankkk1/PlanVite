import 'package:get/get.dart';

import '../to_do/to_do_controller.dart';




class ToDoBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<ToDoController>(ToDoController());
  }

}