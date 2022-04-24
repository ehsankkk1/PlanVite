import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../constants.dart';
import 'drawer_controller.dart';


class DrawerScreen extends GetView<MyDrawerController> {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kLightPink,
      ),
    );
  }
}