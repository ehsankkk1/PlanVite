import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:plane_vite/skeleton/skeleton_controller.dart';
import '../constants.dart';
import '../screens/Drawer/drawer_controller.dart';
import '../screens/Drawer/drawer_screen.dart';

class SkeletonScreen extends GetView<SkeletonController> {

  final SkeletonController _skeletonController=Get.put(SkeletonController());
  final MyDrawerController _myDrawerController = Get.find();

  @override
  Widget build(BuildContext context) {
    const SharedAxisTransitionType? _transitionType = SharedAxisTransitionType.vertical;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<MyDrawerController>(

          builder: (_) => ZoomDrawer(

            moveMenuScreen: true,
            controller: _myDrawerController.zoomDrawerController,
            menuScreen:  DrawerScreen(),

            mainScreen: PageTransitionSwitcher(
              reverse: _skeletonController.isReverse.value,
              duration: const Duration(milliseconds: 600),
              transitionBuilder: (Widget child, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return SharedAxisTransition(
                  child: child,
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: _transitionType,
                );
              },
              child: _skeletonController.Screens.elementAt(_skeletonController.screenIndex.value),
            ),
            mainScreenTapClose: true,
            showShadow: true,
            isRtl: false,
            mainScreenOverlayColor: Colors.black.withOpacity(0.5),
            menuScreenTapClose:true,
            style: DrawerStyle.style1,
            /*        shadowLayer1Color: Colors.grey.withOpacity(0.25),
            shadowLayer2Color: kMainPink,*/
            angle: -0,
            slideWidth: width * 0.90,
          ),
        ),
      ),
    );
  }
}

