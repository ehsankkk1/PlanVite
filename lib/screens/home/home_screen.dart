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
      backgroundColor: kBackGround,
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
      backgroundColor:kBackGround,
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
                    WhiteBox(height*0.38,double.infinity),
                    Padding(
                      padding: EdgeInsets.only(bottom: height*0.27),
                      child: Text('Summary',
                        style: TextStyle(
                          fontSize: 25,
                          color: kWritings,
                        ),),
                    ),
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
                    Padding(
                      padding: EdgeInsets.only(top: height*0.27,left: width*0.37,right: width*0.23),
                      child: Text('Tasks Done',
                        style: TextStyle(
                          fontSize: 25,
                          color: kMainPink,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.only(left: width*0.01,right: width*0.5,top: height*0.02,bottom: height*0.02),
                  child: Text('My Projects',
                  style: TextStyle(
                    color: kWritings,
                    fontSize: 25,
                  ),
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [

                    WhiteBox(height*0.38,double.infinity),
                    Padding(
                      padding: EdgeInsets.only(bottom: height*0.27),
                      child: Text('Sample Projects',
                      style: TextStyle(
                        fontSize: 25,
                        color: kWritings,
                      ),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width*0.07),
                      child: Column(
                        
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 0,right:width*0.66,top: height*0.05,bottom: height*0.01  ),
                            child: Text('header',
                            style: TextStyle(
                              fontSize: 20,
                              color: kWritings,
                            ),
                            ),
                          ),
                          LinearPercentIndicator(
                            percent: 0.6,
                            animation: true,
                            backgroundColor: kLightPink,
                            progressColor: kMainPink,
                            width: width*0.75,
                            lineHeight: height*0.028,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 0,right:width*0.66,top: height*0.02,bottom: height*0.01  ),
                            child: Text('header',
                              style: TextStyle(
                                fontSize: 20,
                                color: kWritings,
                              ),
                            ),
                          ),
                          LinearPercentIndicator(
                            percent: 0.4,
                            animation: true,
                            backgroundColor: kLightPink,
                            progressColor: kMainPink,
                            width: width*0.75,
                            lineHeight: height*0.028,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 0,right:width*0.66,top: height*0.02,bottom: height*0.01  ),
                            child: Text('header',
                              style: TextStyle(
                                fontSize: 20,
                                color: kWritings,
                              ),
                            ),
                          ),
                          LinearPercentIndicator(
                            percent: 0.9,
                            animation: true,
                            backgroundColor: kLightPink,
                            progressColor: kMainPink,
                            width: width*0.75,
                            lineHeight: height*0.028,
                          ),
                        ],
                      ),
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

