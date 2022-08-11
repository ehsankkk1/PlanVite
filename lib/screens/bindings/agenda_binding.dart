
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:plane_vite/screens/agenda/agenda_controller.dart';



class AgendaBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<AgendaController>(AgendaController());
  }

}