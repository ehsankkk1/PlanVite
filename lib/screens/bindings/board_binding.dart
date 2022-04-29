import 'package:get/get.dart';

import '../board/board_controller.dart';



class BoardBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<BoardController>(BoardController());
  }

}