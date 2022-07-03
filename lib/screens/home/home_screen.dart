import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:plane_vite/constants.dart';
import 'package:plane_vite/widgets/app_bar.dart';
import '../../config/SizeConfig.dart';
import '../../skeleton/skeleton_controller.dart';
import '../../widgets/project_view_home.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../widgets/white_box.dart';
import '../Drawer/drawer_controller.dart';
import 'home_controller.dart';


class HomeScreen extends StatelessWidget {
  final MyDrawerController _myDrawerController = Get.find();

  @override
  Widget build(BuildContext context) {
    SkeletonController _skeletonController =Get.find();
    SizeConfig().init(context);
    HomeController _homeController =   Get.put(HomeController());
    return Scaffold(
      backgroundColor: kBackGround,
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * 0.05, height * 0.025, width * 0.05, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // notification and drawer
                      AppBarWidget(
                        controller: _myDrawerController,
                        head: 'Home'.tr,
                      ),
                      SizedBox(
                        height: height*0.05,
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
                                  'Summary'.tr,
                                  style:  TextStyle(
                                    fontSize: 7*SizeConfig.blockSizeHorizontal,
                                    color: kWritings,
                                  ),
                                ),
                                CircularPercentIndicator(
                                  animation: true,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  reverse: true,
                                  progressColor: kMainPink,
                                  backgroundColor: kLightPink,
                                  radius: width > breakPoint ?130.0:110,
                                  lineWidth: width > breakPoint ?15.0:13,
                                  percent: 0.7,
                                  center:  Text(
                                    "70%",
                                    style: TextStyle(
                                        fontSize:  6*SizeConfig.blockSizeHorizontal,
                                        color: kMainPink,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                Text(
                                  'Tasks\nDone'.tr,
                                  style:  TextStyle(
                                    fontSize: 6*SizeConfig.blockSizeHorizontal,
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

                      SizedBox(
                        height: height*0.05,
                      ),
                      Text(
                        'My Projects'.tr,
                        style:  TextStyle(
                          color: kWritings,
                          fontSize:6*SizeConfig.blockSizeHorizontal,
                        ),
                      ),
                    ],
                  ),
                ),
                // Page view
                NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overScroll) {
                    overScroll.disallowIndicator();
                    return true;
                  },
                  child: GestureDetector(
                    onTap: (){
                      _skeletonController.changeScreen(1);
                    },
                    child: Container(
                      height: height*0.4,
                      child: PageView(
                        controller:  PageController(viewportFraction: 0.80),
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          3,
                              (index) => ProjectView(),
                        ),

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
