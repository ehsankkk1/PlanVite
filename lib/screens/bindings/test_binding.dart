import 'package:get/get.dart';

import '../../test/test_controller.dart';




class TestBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<TestController>(TestController());
  }

}