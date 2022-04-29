import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../constants.dart';
import '../Drawer/drawer_controller.dart';
import '../Drawer/drawer_screen.dart';


class BoardScreen extends StatelessWidget {
  @override
  MyDrawerController controller = Get.find();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<MyDrawerController>(
        builder: (_) => ZoomDrawer(
          moveMenuScreen: true,
          controller: _.zoomDrawerController,
          menuScreen: const DrawerScreen(),
          mainScreen: _MainScreen(),
          showShadow: true,
          mainScreenOverlayColor: Colors.black.withOpacity(0.5),
          style: DrawerStyle.style1,
          /*        shadowLayer1Color: Colors.grey.withOpacity(0.25),
          shadowLayer2Color: kMainPink,*/
          angle: -0,
          slideWidth: MediaQuery.of(context).size.width * 0.90,
        ),
      ),
    );
  }
}

class _MainScreen extends StatelessWidget {
  MyDrawerController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    return  Scaffold(
        backgroundColor: kBackGround,
        body: SafeArea(
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowGlow();
              return true;
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    width * 0.05, height * 0.025, width * 0.05, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // notification and drawer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: const Icon(
                            Icons.menu_rounded,
                            color: kMainPink,
                            size: 40,
                          ),
                          onTap: controller.toggleDrawer,
                        ),
                        const Text(
                          'Sample Project',
                          style: TextStyle(
                            fontSize: 18,
                            color: kWritings,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          child: const Icon(
                            Icons.notifications,
                            color: kMainPink,
                            size: 40,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}