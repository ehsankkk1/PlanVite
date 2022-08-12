import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:plane_vite/screens/sprint/sprint_controller.dart';
import 'package:plane_vite/widgets/user_card_widget.dart';
import '../../constants.dart';
import '../../widgets/app_bar_no_drawer.dart';
import '../../widgets/sprint_view_widget.dart';
import '../../widgets/task_widget.dart';
import '../Drawer/drawer_controller.dart';
import 'back_log_controller.dart';


class BackLogScreen extends GetView<BackLogScreen> {


  final MyDrawerController _myDrawerController = Get.find();
  final BackLogController _backLogController = Get.put(BackLogController());
  final SprintController _sprintController = Get.put(SprintController());


  @override
  Widget build(BuildContext context) {
    BackLogController controller = Get.find();
    Widget buildRating(var index) =>
        RatingBar.builder(
          minRating: 0,
          allowHalfRating: false,

          itemBuilder: (context, _) =>
              Icon(Icons.star, color: context.theme.primaryColor),
          onRatingUpdate: (rating) {
            controller.rating.value = rating.toInt();
            _backLogController.userRate=rating;

          },

        );
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              width * 0.03, height * 0.025, width * 0.03, 0),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // notification and drawer
                AppBarWidgetNoDrawer(
                  save: false,
                  head: 'Back Log'.tr,
                 onBackTap: (){
                    Get.back();
                    _sprintController.load();
                 },

                ),
                const SizedBox(height: 0),
                _backLogController.isLoading.value
                    ? Expanded(
                  //height: height * 0.88,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GetBuilder<BackLogController>(builder: (_backLogController) {
                            return SprintWidget(
                                addButton: _backLogController.isAdmin,
                                checkBox: false,
                                sprintName: "Users".tr,
                                onTap: () {
                                  _backLogController.showAddUserField(context);
                                },
                                coloredBoxes: List.generate(
                                  _backLogController.allProjectUsers.length,
                                      (index) =>
                                      HoldDetector(
                                        onHold: (){
                                          showDialog(context: context, builder: (context)=>AlertDialog(
                                            title: Center(
                                              child: Text('Please leave a star rating'.tr,
                                                style: TextStyle(color: context.theme.textTheme.caption!.color),
                                              ),
                                            ),
                                            content: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisSize:MainAxisSize.min ,
                                              children: [
                                                Text('rate user '.tr +'$index',),
                                                SizedBox(height: 30,),
                                                buildRating(index),

                                              ],
                                            ),actions: [
                                            TextButton(onPressed: (){
                                              Navigator.pop(context);
                                              _backLogController.rateUser(

                                                  _backLogController.allProjectUsers[index].id,context);
                                             }, child: Text('Ok',
                                              style: TextStyle(color: context.theme.textTheme.caption!.color,),
                                            ),)
                                          ],
                                          ),);
                                        },
                                        child: UserCardWidget(
                                            _backLogController.allProjectUsers[index].email!
                                            , true,(){_backLogController.kickUser(_backLogController.allProjectUsers[index].id,context,_backLogController.allProjectUsers[index].email);},
                                        ),
                                      ),
                                )
                            );
                          }),
                          GetBuilder<BackLogController>(
                              builder: (_backLogController) {
                                return SprintWidget(
                                  addButton: _backLogController.isAdmin,
                                  checkBox: false,
                                  sprintName: "Statues".tr,
                                  onTap: () {
                                    _backLogController.showAddStatues(context);
                                  },
                                  coloredBoxes: List.generate(
                                    _backLogController.allStatues!.length,
                                        (index) =>
                                        UserCardWidget(
                                            _backLogController
                                                .allStatues![index]
                                                .name ?? '',
                                            false,_backLogController.nothing,
                                        ),
                                  ),
                                );
                              }),
                          GetBuilder<BackLogController>(
                            assignId: true,
                            builder: (_backLogController) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                  _backLogController.allSprints!.length,
                                      (index) =>
                                      SprintWidget(
                                          onTap: () {
                                            _backLogController.showAddTaskField(
                                                index,
                                                _backLogController
                                                    .allSprints![index].id!,
                                                context);
                                          },
                                          addButton: _backLogController.isAdmin,
                                          checkBoxValue: _backLogController
                                              .allSprints![index].isActive!,
                                          onChangedBoxValue: (value) {
                                            _backLogController
                                                .toggleSprintValue(
                                                index, context);
                                          },
                                          checkBox: _backLogController.isAdmin,
                                          sprintName: _backLogController
                                              .allSprints![index].name!,
                                          coloredBoxes: List.generate(
                                              _backLogController
                                                  .allSprints![index].tasks!
                                                  .length,
                                                  (index2) =>
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8.0),
                                                    child: TaskWidget(

                                                      backLog: true,
                                                      name: _backLogController
                                                          .allSprints![index]
                                                          .tasks![index2].name,
                                                      dueDate: _backLogController
                                                          .allSprints![index]
                                                          .tasks![index2]
                                                          .deadline,
                                                      priority: _backLogController
                                                          .allSprints![index]
                                                          .tasks![index2]
                                                          .priority,
                                                      task: _backLogController
                                                          .allSprints![index]
                                                          .tasks![index2],
                                                      taskIndex: index2,
                                                      sprintIndex: index,
                                                      loading: false,
                                                    ),
                                                  )
                                          )
                                      ),
                                ),
                              );
                            },
                          ),
                          _backLogController.isAdmin?_addButtonSprint(
                            onTap: () {
                              _backLogController.showAddSprintField(context);
                            },
                          ):Container(),
                        ],
                      ),
                    )


                )
                    : Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: context.theme.primaryColor,
                      color: context.theme.cardColor,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }


}

class _addButtonSprint extends StatelessWidget {
  _addButtonSprint({
    required this.onTap,
  });

  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Material(
          elevation: 6,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            width: width * 0.77,
            height: height * 0.3,
            decoration: BoxDecoration(
              /*border: Border.all(color: darkSecondaryColor,width: 3),*/
              color: context.theme.hintColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),),
            child: Icon(
              Icons.add, size: 100, color: context.theme.primaryColor,),
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