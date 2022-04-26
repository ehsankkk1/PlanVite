import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:plane_vite/constants.dart';
import '../../widgets/project_view_home.dart';
import '../../widgets/white_box.dart';
import '../Drawer/drawer_controller.dart';
import '../Drawer/drawer_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeScreen extends StatelessWidget {
  @override
  MyDrawerController controller = Get.find();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGround,
      body: GetBuilder<MyDrawerController>(
        builder: (_) => ZoomDrawer(
          moveMenuScreen: true,
          controller: _.zoomDrawerController,
          menuScreen: DrawerScreen(),
          mainScreen: _MainScreen(),
          borderRadius: 10.0,
          showShadow: true,
          shadowLayer1Color: kLightPink,
          shadowLayer2Color: kMainPink,
          angle: 0,
          slideWidth: MediaQuery.of(context).size.width * 0.75,
        ),
      ),
    );
  }
}

class _MainScreen extends StatelessWidget {
  MyDrawerController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackGround,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                width * 0.05, height * 0.025, width * 0.05, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Container(
                    height: height * 0.36,
                    child: Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.center,
                      children: [
                        WhiteBox(double.infinity, double.infinity),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Summary',
                              style: TextStyle(
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
                              'Tasks\nDone',
                              style: TextStyle(
                                fontSize: 25,
                                color: kMainPink,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'My Projects',
                  style: TextStyle(
                    color: kWritings,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overScroll) {
                    overScroll.disallowGlow();

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
    );
  }
}
