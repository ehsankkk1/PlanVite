
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:plane_vite/skeleton/skeleton_controller.dart';
import '../constants.dart';
import '../screens/Drawer/drawer_controller.dart';
import '../screens/Drawer/drawer_screen.dart';
import '../screens/sprint/sprint_screen.dart';



class SkeletonScreen extends StatelessWidget {

  @override
  final SkeletonController _skeletonController =Get.put(SkeletonController());
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<MyDrawerController>(

          builder: (_) => ZoomDrawer(
            //duration: Duration(microseconds: 0),
            //reverseDuration: Duration(microseconds: 0),
            moveMenuScreen: true,
            controller: _skeletonController.myDrawerController.zoomDrawerController,
            menuScreen:  DrawerScreen(),
            mainScreen: _skeletonController.Screens[_skeletonController.screenIndex],
            showShadow: true,
            isRtl: false,
            mainScreenOverlayColor: Colors.black.withOpacity(0.5),
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

