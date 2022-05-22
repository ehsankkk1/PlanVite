import 'package:get/get.dart';
import '../../skeleton/skeleton_controller.dart';


class SkeletonBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<SkeletonController>(SkeletonController());
  }

}