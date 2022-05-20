import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plane_vite/widgets/user_card_widget.dart';
import '../../constants.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/sprint_view_widget.dart';
import '../Drawer/drawer_controller.dart';


class BackLogScreen extends StatelessWidget {
  const BackLogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyDrawerController controller = Get.find();
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
                controller: controller,
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
