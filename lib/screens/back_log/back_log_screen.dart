import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:plane_vite/widgets/user_card_widget.dart';
import '../../constants.dart';
import '../../skeleton/skeleton_controller.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/app_bar_no_drawer.dart';
import '../../widgets/sprint_view_widget.dart';
import '../Drawer/drawer_controller.dart';
import '../Drawer/drawer_screen.dart';
import 'back_log_controller.dart';

class BackLogScreen extends GetView<BackLogScreen> {



  final MyDrawerController _myDrawerController = Get.find();
  final BackLogController _backLogController = Get.put(BackLogController());

  @override

  Widget build(BuildContext context) {
    BackLogController controller = Get.find();
    Widget buildRating(var index)=> RatingBar.builder(
      minRating: 1,
      itemBuilder: (context,_)=>Icon(Icons.star,color:context.theme.primaryColor), onRatingUpdate: (rating)  {

      controller.rating.value=rating.toInt();
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
                const SizedBox(height:10),
                Expanded(
                  //height: height * 0.88,
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
                              checkBox: true,
                              sprintName: "Pending".tr,
                              coloredBoxes: List.generate(
                                index + 4,
                                    (index) => HoldDetector(
                                      onHold: (){
                                    showDialog(context: context, builder: (context)=>AlertDialog(

                                    title: Text('Rate this user$index',
                                    style: TextStyle(color: context.theme.textTheme.caption!.color),
                                    ),
                                    content: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize:MainAxisSize.min ,
                                    children: [
                                    Text('please leave a star rating',),
                                    SizedBox(height: 30,),
                                    buildRating(index),

                                    ],
                                    ),actions: [
                                    TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Ok'),)
                                    ],
                                    ),);
                                    },
                                      child: TextButton(
                                          onPressed: (){
                                            //showRating(index);
                                          },
                                          child: UserCardWidget('user $index')),
                                    ),
                              ),
                            )
                          ]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  }
}
