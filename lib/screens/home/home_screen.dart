import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:plane_vite/constants.dart';
import 'package:plane_vite/widgets/app_bar.dart';
import '../../widgets/project_view_home.dart';
import '../../widgets/white_box.dart';
import '../Drawer/drawer_controller.dart';
import '../Drawer/drawer_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeScreen extends StatelessWidget {
  @override
  MyDrawerController controller = Get.find();
  Widget build(BuildContext context) {
    return Directionality(
     textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<MyDrawerController>(
          builder: (_) => ZoomDrawer(
            moveMenuScreen: true,
            controller: _.zoomDrawerController,
            menuScreen: DrawerScreen(),
            mainScreen: _MainScreen(),
            showShadow: true,
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

class _MainScreen extends StatelessWidget {
  MyDrawerController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGround,
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
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
                  AppBarWidget(
                    controller: controller,
                    head: 'Home'.tr,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // circular indicator widget
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Container(
                      height: height * 0.36,
                      child: WhiteBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Summary'.tr.tr,
                              style: const TextStyle(
                                fontSize: 25,
                                color: kWritings,
                              ),
                            ),
                            CircularPercentIndicator(
                              animation: true,
                              circularStrokeCap: CircularStrokeCap.round,
                              reverse: true,
                              progressColor: kMainPink,
                              backgroundColor: kLightPink,
                              radius: 130.0,
                              lineWidth: 15.0,
                              percent: 0.7,
                              center: const Text(
                                "70%",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: kMainPink,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            Text(
                              'Tasks\nDone'.tr,
                              style: const TextStyle(
                                fontSize: 25,
                                color: kMainPink,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'My Projects'.tr,
                    style: const TextStyle(
                      color: kWritings,
                      fontSize: 25,
                    ),
                  ),

                  //My projects
                  NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll) {
                      overScroll.disallowIndicator();
                      return true;
                    },
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(right: 15),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          3,
                          (index) => ProjectView(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
