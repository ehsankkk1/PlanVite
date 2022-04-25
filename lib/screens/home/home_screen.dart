import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:plane_vite/constants.dart';
import '../../widgets/white_box.dart';
import '../Drawer/drawer_controller.dart';
import '../Drawer/drawer_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';


class HomeScreen extends StatelessWidget {
  @override
  MyDrawerController controller = Get.find();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<MyDrawerController>(
        builder: (_) => ZoomDrawer(
          moveMenuScreen: true,
          controller: _.zoomDrawerController,
          menuScreen: DrawerScreen(),
          mainScreen: _MainScreen(),
          borderRadius: 10.0,
          showShadow: true,
          shadowLayer1Color:kLightPink,
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
            padding:  EdgeInsets.fromLTRB(width*0.05, height*0.025, width*0.05, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Icon(Icons.menu_rounded, color: kMainPink,size: 40,),
                      onTap: controller.toggleDrawer,
                    ),
                    InkWell(
                      child: Icon(Icons.notifications, color: kMainPink,size: 40,),
                      onTap: (){},
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    WhiteBox(height*0.35,double.infinity),
                    CircularPercentIndicator(
                      animation: true,
                      circularStrokeCap: CircularStrokeCap.round,
                      reverse: true,
                      progressColor: kMainPink,
                      backgroundColor: kLightPink,
                      radius: 150.0,
                      lineWidth: 20.0,
                      percent: 0.7,
                      center: new Text("70%",style: TextStyle(fontSize: 20,color: kMainPink,fontWeight: FontWeight.w900),),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

