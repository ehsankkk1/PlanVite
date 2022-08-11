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
  HomeController _homeController =   Get.put(HomeController());
  //HomeController _homeController=Get.find();

  @override
  Widget build(BuildContext context) {
    SkeletonController _skeletonController =Get.find();
    SizeConfig().init(context);


      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child:

                 Column(
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
                            height: height*0.02,
                          ),
                          // circular indicator widget
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                            child: Container(
                              height: width * 0.8,
                              child: WhiteBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Summary'.tr,
                                      style:  TextStyle(
                                        fontFamily: 'HacenN',
                                        fontSize: 7*SizeConfig.blockSizeHorizontal,
                                        color: context.theme.textTheme.caption!.color,
                                      ),
                                    ),
                                    Obx((){
                                      if(_homeController.isLoading.isFalse){
                                        return  CircularPercentIndicator(
                                          animation: true,
                                          circularStrokeCap: CircularStrokeCap.round,
                                          reverse: true,
                                          progressColor: context.theme.primaryColor,
                                          backgroundColor: context.theme.primaryColorLight,
                                          radius: width > breakPoint ?130.0:110,
                                          lineWidth: width > breakPoint ?15.0:13,
                                          percent: double.parse(_homeController.home!.tasksDoneInAllProject),
                                          center:  Text(
                                              (double.parse(_homeController.home!.tasksDoneInAllProject)*100).round().toString()+'%',
                                            style: TextStyle(
                                                fontFamily: 'HacenN',
                                                fontSize:  6*SizeConfig.blockSizeHorizontal,
                                                color: context.theme.primaryColor,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        );
                                      }
                                      return Center(
                                        child: SizedBox(
                                          height: 100,
                                          width:  100,
                                          child: CircularProgressIndicator(

                                            strokeWidth: 12,
                                            color: context.theme.primaryColor,
                                                     backgroundColor: context.theme.primaryColorLight,
                                          ),
                                        ),
                                      );

                                    }),

                                    Text(
                                      'Tasks\nDone'.tr,
                                      style:  TextStyle(
                                        fontFamily: 'HacenN',
                                        fontSize: 6*SizeConfig.blockSizeHorizontal,
                                        color: context.theme.primaryColor,
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
                          Center(
                            child: Text(
                              'My Projects'.tr,
                              style:  TextStyle(fontFamily: 'HacenN',
                                color: context.theme.textTheme.caption!.color,
                                fontSize:6*SizeConfig.blockSizeHorizontal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Page view
                    GestureDetector(
                      onTap: (){
                        //_skeletonController.changeScreen(1);
                      },
                      child: Obx((){
                        if(_homeController.isLoading.isFalse){
                          return Container(
                            height: width * 0.9,
                            child: PageView(
                              controller:  PageController(viewportFraction: 0.80),
                              scrollDirection: Axis.horizontal,
                              children: List.generate(
                                _homeController.home?.projects==null?0:_homeController.home!.projects.length,
                                //_homeController.projects!.projects==[]?0:_homeController.projects!.projects.length,
                                    (index) => ProjectView(head: _homeController.home!.projects[index].name,

                                  daysGone: _homeController.home!.projects[index].daysGone,
                                  totalDays: _homeController.home!.projects[index].totalDays,
                                      completedTasks: _homeController.home!.projects[index].tasksDoneInProject,
                                      allProjectsTasksDone: double.parse(_homeController.home!.tasksDoneInAllProject),




                                ),
                              ),

                            ),
                          );

                        }
                        else return Text('');

                      }),
                    )
                  ],
                ),

              // return Center(
              //   child: Column(
              //     children: [
              //       SizedBox(
              //         height: height*0.3,
              //       ),
              //       CircularProgressIndicator(
              //
              //         color: context.theme.primaryColor,
              //         backgroundColor: context.theme.primaryColorLight,
              //       ),
              //     ],
              //   ),
              // );


          ),
        ),
      );

  }
}
