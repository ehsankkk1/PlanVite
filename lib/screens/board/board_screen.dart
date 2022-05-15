import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:plane_vite/widgets/app_bar.dart';
import 'package:plane_vite/widgets/colored_box.dart';
import '../../constants.dart';
import '../../test/test.dart';
import '../../widgets/sprint_widget.dart';
import '../Drawer/drawer_controller.dart';
import '../Drawer/drawer_screen.dart';
import 'board_controller.dart';

class BoardScreen extends StatelessWidget {
  @override
  MyDrawerController controller = Get.find();

  Widget build(BuildContext context) {
    return Directionality(
            textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<MyDrawerController>(
          builder: (_) =>
              ZoomDrawer(
                moveMenuScreen: true,
                controller: _.zoomDrawerController,
                menuScreen: const DrawerScreen(),
                mainScreen: _MainScreen(),
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

class _MainScreen extends StatelessWidget {

  MyDrawerController controller = Get.find();
  BoardController _boardController = Get.find();

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
                head: 'Sample Project'.tr,
              ),
            ),
            Container(
                height: height * 0.88,
                child: BoardViewExample()
            ),
            /*NotificationListener<OverscrollIndicatorNotification>(

              onNotification: (overScroll) {
                overScroll.disallowIndicator();
                return true;
              },
              child: Container(
                height: height * 0.88,
                child: PageView.builder(
                  clipBehavior: Clip.none,
                  controller: PageController(viewportFraction: 0.78),
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          SprintWidget(
                            addButton: true,
                            sprintName: "Pending".tr,
                            coloredBoxes: List.generate(
                              index + 4,
                                  (index) => ColorBox('Build Flutter UwU'),
                            ),
                          )
                        ]);
                  },
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
