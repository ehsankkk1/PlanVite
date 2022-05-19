
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import '../back_log/back_log_controller.dart';


class BackLogBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<BackLogController>(BackLogController());
  }

}