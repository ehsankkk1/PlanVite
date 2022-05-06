import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:plane_vite/widgets/app_bar.dart';
import 'package:plane_vite/widgets/colored_box.dart';
import 'package:plane_vite/widgets/white_box.dart';
import '../../constants.dart';
import '../../widgets/sprint_widget.dart';
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
          slideWidth: width * 0.90,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // notification and drawer
            Padding(
              padding: EdgeInsets.fromLTRB(
                  width * 0.03, height * 0.025, width * 0.03, 0),
              child: AppBarWidget(
                controller: controller,
                head: 'Sample Project',
              ),
            ),
            NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowIndicator();
                return true;
              },
              child: SingleChildScrollView(

                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // sprints
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        3,
                        (index) => SprintWidget(
                          addButton: true,
                            sprintName: "Pending",
                            coloredBoxes: List.generate(index + 4,
                                (index) => ColorBox('Build Flutter UwU'),
                            ),
                        ),
                      ),
                    ),

                    // add sprint
                    Container(
                      margin: EdgeInsets.fromLTRB(width * 0.03, 35, width * 0.03, 35),
                        child: WhiteBox(height: height*0.35, width: width*0.7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                          Icon(Icons.add_circle_outline_rounded,size: 120,color: kMainPink,),
                            Text(
                              'Add new sprint',
                              style:  TextStyle(
                                color: kWritings,
                                fontSize: 18,
                              ),
                            ),
                        ],),)
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
