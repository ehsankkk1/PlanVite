import 'package:get/get.dart';
import 'package:plane_vite/screens/notifications/notifications_controller.dart';

class NotificationsBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<NotificationsController>(NotificationsController());
  }

}