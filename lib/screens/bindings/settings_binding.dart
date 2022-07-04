import 'package:get/get.dart';
import 'package:plane_vite/settings/settings_controller.dart';

class SettingsBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<SettingsController>(SettingsController());
  }

}