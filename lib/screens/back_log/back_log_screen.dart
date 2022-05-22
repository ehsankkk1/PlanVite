import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plane_vite/widgets/user_card_widget.dart';
import '../../constants.dart';
import '../../skeleton/skeleton_controller.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/sprint_view_widget.dart';
import '../Drawer/drawer_controller.dart';
import '../Drawer/drawer_screen.dart';
import 'back_log_controller.dart';

class BackLogScreen extends StatelessWidget {


  final SkeletonController _skeletonController = Get.find();
  final BackLogController _backLogController = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kBackGround,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              width * 0.03, height * 0.025, width * 0.03, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // notification and drawer
              AppBarWidget(
                controller: _skeletonController.myDrawerController,
                head: 'Sample Project'.tr,
              ),
              NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll) {
                  overScroll.disallowIndicator();
                  return true;
                },
                child: Container(
                  height: height * 0.88,
                  child: ListView.builder(
                    clipBehavior: Clip.none,
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            SprintWidget(
                              addButton: true,
                              checkBox: false,
                              sprintName: "Pending".tr,
                              coloredBoxes: List.generate(
                                index + 4,
                                    (index) => UserCardWidget('user $index'),
                              ),
                            )
                          ]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
