import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:plane_vite/screens/board/board_controller.dart';
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
          mainScreenTapClose: true,
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
  BoardController _boardController = Get.find();
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
                    Container(
                      width: width,
                      child: CarouselSlider(
                        items: List.generate(
                          1,
                          (index) => SprintWidget(
                            addButton: true,
                            sprintName: "Pending",
                            coloredBoxes: List.generate(
                              2,
                              (index) => ColorBox('Build Flutter UwU'),
                            ),
                          ),
                        ),
                        options: CarouselOptions(
                          enableInfiniteScroll: false,
                        ),
                      ),
                    ),

                    // add sprint
                    Container(
                        margin: EdgeInsets.fromLTRB(
                            width * 0.03, 20, width * 0.03, 5),
                        child: WhiteBox(
                          height: height * 0.35,
                          width: width * 0.7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.add_circle_outline_rounded,
                                size: 120,
                                color: kMainPink,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Add new Sprint',
                                style: TextStyle(
                                  color: kWritings,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        )),
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
