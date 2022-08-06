import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plane_vite/widgets/user_card_widget.dart';
import '../../constants.dart';
import '../../widgets/app_bar_no_drawer.dart';
import '../../widgets/sprint_view_widget.dart';
import '../Drawer/drawer_controller.dart';
import 'back_log_controller.dart';


class BackLogScreen extends GetView<BackLogScreen> {


  final MyDrawerController _myDrawerController = Get.find();
  final BackLogController _backLogController = Get.put(BackLogController());


  @override
  Widget build(BuildContext context) {
    BackLogController controller = Get.find();
    Widget buildRating(var index) =>
        RatingBar.builder(
          minRating: 0.5,
          allowHalfRating: true,

          itemBuilder: (context, _) =>
              Icon(Icons.star, color: context.theme.primaryColor),
          onRatingUpdate: (rating) {
            controller.rating.value = rating.toInt();
          },

        );
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              width * 0.03, height * 0.025, width * 0.03, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // notification and drawer
              AppBarWidgetNoDrawer(
                head: 'Back Log'.tr,
              ),
              const SizedBox(height: 0),
              Expanded(
                //height: height * 0.88,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() {
                          return SprintWidget(
                              addButton: true,
                              checkBox: true,
                              sprintName: "Users",
                              onTap: () {
                                _backLogController.showAddUserField(context);
                              },
                              coloredBoxes: List.generate(
                                _backLogController.allProjectUsers.length,
                                    (index) => UserCardWidget(_backLogController.allProjectUsers[index]),
                              )
                          );
                        }),
                        SprintWidget(
                            addButton: true,
                            checkBox: true,
                            sprintName: "Statues",
                            coloredBoxes: List.generate(
                              4, (index) => UserCardWidget('user $index'),
                            )
                        ),
                        SprintWidget(
                            addButton: true,
                            checkBox: true,
                            sprintName: "Sprint 1",
                            coloredBoxes: List.generate(
                              4, (index) => UserCardWidget('user $index'),
                            )
                        ),
                        SprintWidget(
                            addButton: true,
                            checkBox: true,
                            sprintName: "Sprint 2",
                            coloredBoxes: List.generate(
                              4, (index) => UserCardWidget('user $index'),
                            )
                        ),
                      ],
                    ),
                  )


              ),
            ],
          ),
        ),
      ),
    );
  }

}


// List.generate(
//  index + 4,
// (index) => HoldDetector(
//   onHold: (){
// showDialog(context: context, builder: (context)=>AlertDialog(
//  title: Center(
//  child: Text('Please leave a star rating'.tr,
//     style: TextStyle(color: context.theme.textTheme.caption!.color),
//     ),
//     ),
// content: Column(
//  crossAxisAlignment: CrossAxisAlignment.center,
//    mainAxisSize:MainAxisSize.min ,
//  children: [
// Text('rate user '.tr +'$index',),
// SizedBox(height: 30,),
//  buildRating(index),
//
// ],
// ),actions: [
// TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Ok',
// style: TextStyle(color: context.theme.textTheme.caption!.color,),
//  ),)
//  ],
//  ),);
//  },
//   child: TextButton(
//   onPressed: (){
//   //showRating(index);
// },
// child: UserCardWidget('user $index')),
//  ),
//  ),