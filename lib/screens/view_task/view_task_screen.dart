import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:plane_vite/constants.dart';

import 'package:plane_vite/screens/view_task/view_task_controller.dart';
import 'package:plane_vite/widgets/custom_check_box.dart';
import '../../widgets/app_bar_no_drawer.dart';
import '../../widgets/priorty_widget.dart';

class ViewTaskScreen extends StatelessWidget {
  TextEditingController subTaskDescriptionController = new TextEditingController();
  TextEditingController subTaskNameController = new TextEditingController();
  ViewTaskController controller = Get.find();
  void ShowAlert(BuildContext context) {
    var alertDialog = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      actions: [
        TextButton(
          onPressed: () {
            controller.subTaskdescription = subTaskDescriptionController.text;
            controller.subTaskName = subTaskNameController.text;
            onClickAdd();

            Navigator.pop(context);
          },
          child: Text(
            'Add',
            style: TextStyle(
              color: context.theme.textTheme.caption!.color!,
            ),
          ),
        )
      ],
      backgroundColor: context.theme.backgroundColor,
      title: Center(
          child: Text(
            'Add Subtask',
            style: TextStyle(
              color: context.theme.textTheme.caption!.color!,
            ),
          )),
      content: Wrap(
        alignment: WrapAlignment.center,
        children: [
          SizedBox(
            height: height * 0.01,
          ),
          TextField(
            style: TextStyle(
              color: context.theme.canvasColor,
            ),
             controller: subTaskNameController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            cursorColor: context.theme.primaryColor,
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
              enabledBorder:
              const OutlineInputBorder(borderSide: BorderSide.none),
              hintText: 'Task Name'.tr,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          TextField(
            style: TextStyle(
              color: context.theme.canvasColor,
            ),
            controller: subTaskDescriptionController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            cursorColor: context.theme.primaryColor,
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
              enabledBorder:
              const OutlineInputBorder(borderSide: BorderSide.none),
              hintText: 'Add More Details to this Task'.tr,
              hintStyle: const TextStyle(

                color: Colors.grey,
              ),
            ),
          ),


          SizedBox(
            height: height * 0.1,
          ),
        ],
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext) {
          return alertDialog;
        });
  }
  void onClickAdd() async {
    EasyLoading.show(
      status: 'Loading...',
    );

    await controller.addSubTaskOnClick();
    if (controller.addSubTaskStatus) {
      EasyLoading.showSuccess(controller.message);
    } else {
      EasyLoading.showError(
        controller.message,
        duration: Duration(seconds: 10),
        dismissOnTap: true,
      );

      print('error here');
    }
  }

  File? _file1;

  @override
  Widget build(BuildContext context) {
    ViewTaskController _viewTaskController = Get.find();
    return SafeArea(
      child: Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            backgroundColor: context.theme.backgroundColor,
            body: SingleChildScrollView(
              child: Obx((){
                if(controller.isLoading.isTrue){
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(height: height*0.3,),
                        CircularProgressIndicator(
                          backgroundColor: context.theme.primaryColor,
                          color: context.theme.cardColor,
                        ),
                      ],
                    ),
                  );
                }
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(width * 0.03, height * 0.025,
                          width * 0.03, height * 0.025),
                      child: AppBarWidgetNoDrawer(
                        visible: true,
                        head: controller.viewTask!.name,

                      ),
                    ),

                    SizedBox(
                      height: height * 0.03,
                    ),
                    // Row(
                    //   children: [
                    //     SizedBox(
                    //       width: width * 0.1,
                    //     ),
                    //     // CustomCheckbox(
                    //     //   onTap: () {
                    //     //     // controller.PickApproved();
                    //     //   },
                    //     //   color: context.theme.textTheme.caption!.color!,
                    //     //   size: 20,
                    //     //   iconSize: 18,
                    //     //   isSelected: true,
                    //     // ),
                    //     // SizedBox(
                    //     //   width: width * 0.03,
                    //     // ),
                    //     // Text(
                    //     //   'Approved'.tr,
                    //     //   style: TextStyle(
                    //     //     color: Colors.grey,
                    //     //     fontSize: 18,
                    //     //   ),
                    //     // )
                    //   ],
                    // ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        // Obx(() {
                        // return GestureDetector(
                        // onTap: () {
                        //controller.dateBool.value = false;
                        //showDatePicker(
                        // context: context,
                        // initialDate: DateTime.now(),
                        // firstDate: DateTime(2021),
                        // lastDate: DateTime(2023),
                        // builder: (context, child) => Theme(
                        // data: ThemeData().copyWith(
                        //   colorScheme: ColorScheme.dark(
                        //  primary: context.theme.primaryColor,
                        //   onPrimary: context
                        //     .theme.textTheme.caption!.color!,
                        //  surface: context.theme.primaryColor,
                        //  onSurface: context
                        //     .theme.textTheme.caption!.color!,
                        // ),
                        // dialogBackgroundColor: Colors.white30,
                        // ),
                        // child: child!,
                        //  ),
                        //).then((date) {
                        // controller.year = date?.year.toString();
                        // controller.month = date?.month.toString();
                        //controller.day = date?.day.toString();

                        // controller.date = date.toString();

                        // controller.PickDate();
                        // });
                        // },
                        // child: Icon(
                        //  Icons.date_range,
                        // color: controller.dateBool.value
                        //     ? context.theme.primaryColor
                        //    : kGrey,
                        // ));
                        // }),


                        Text(
                          'Deadline : '+controller.viewTask!.deadline.year.toString()+'/'+controller.viewTask!.deadline.month.toString()+'/'+controller.viewTask!.deadline.day.toString(),
                          // controller.dateBool == false
                          // ? 'Due Date'.tr
                          // : '${controller.year}/${controller.month}/${controller.day}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: height * 0.03,
                    ),
                    /*Material(
                              elevation: 6,
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: context.theme.cardColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: context.theme
                                            .primaryColor,
                                        child: const CircleAvatar(
                                          radius: 29,
                                          backgroundColor: Colors.black12,
                                          foregroundImage: AssetImage(
                                              'images/joey.png'),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.05,
                                      ),
                                      Flexible(
                                        child: Text(
                                          'Ehsan abourshed',
                                          style: TextStyle(
                                              color: context.theme.textTheme
                                                  .caption!.color, fontSize: 18),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),*/
                    // GetBuilder<ViewTaskController>(
                    //   assignId: true,
                    //   builder: (_taskController) {
                    //     return Container(
                    //       decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       child: DropdownButton(
                    //         hint: const Center(
                    //             child: Text('Select User to Assign', style: TextStyle(fontSize: 16),)),
                    //         underline: Container(),
                    //         menuMaxHeight: 225,
                    //         isExpanded: true,
                    //         borderRadius: BorderRadius.circular(10),
                    //         style: TextStyle(
                    //             color: context.theme.textTheme.caption!.color,
                    //             fontSize: 16),
                    //         value: _taskController.allUserDropDownValue,
                    //         onChanged: (newValue) {
                    //           print(newValue.toString());
                    //
                    //           _taskController.setAllUserDropDownValue(int.parse(newValue.toString()));
                    //         },
                    //         items: _taskController.allUsersDropDown.map((user) {
                    //           return DropdownMenuItem(
                    //             child: Padding(
                    //               padding: const EdgeInsets.symmetric(vertical: 8),
                    //               child: Row(
                    //                 children: [
                    //                   CircleAvatar(
                    //                     radius: 20,
                    //                     backgroundColor: context.theme
                    //                         .primaryColor,
                    //                     child: const CircleAvatar(
                    //                       radius: 20,
                    //                       backgroundColor: Colors.black12,
                    //                       foregroundImage: AssetImage(
                    //                           'images/joey.png'),
                    //                     ),
                    //                   ),
                    //                   SizedBox(width: width*0.05,),
                    //                   Center(child: Text(user.name!)),
                    //                 ],
                    //               ),
                    //             ),
                    //             value: user.id,
                    //           );
                    //         }).toList(),
                    //       ),
                    //     );
                    //   },
                    // ),
                    Text(
                      'The task is assigned to : '.tr,
                      style: TextStyle(
                        color: context.theme.textTheme.caption!.color!,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        elevation: 6,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          decoration: BoxDecoration(
                            color: context.theme.cardColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                CircleAvatar(
                                  radius: 37,
                                  backgroundColor: context.theme.primaryColor,
                                  child: const CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Colors.black12,
                                    foregroundImage:
                                    AssetImage('images/joey.png'),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                Text(
                                  controller.viewTask!.assigneeInfo.name,
                                  style: TextStyle(
                                    color: context.theme.textTheme.caption!.color,
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Text(
                      'Fields'.tr,
                      style: TextStyle(
                        color: context.theme.textTheme.caption!.color!,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        elevation: 6,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          decoration: BoxDecoration(
                            color: context.theme.cardColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                Text(
                                  'Priority'.tr,
                                  style: TextStyle(
                                    color:
                                    context.theme.textTheme.caption!.color!,
                                    fontSize: 17,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    //controller.PickLow();
                                  },
                                  child: PriorityWidget(


                                    name: 'Low'.tr,
                                     colour: controller.viewTask!.priority =='low'
                                         ? context.theme.primaryColor
                                         : context.theme.primaryColorLight,
                                     textColor: controller.viewTask!.priority == 'low'
                                     ? context
                                      .theme.textTheme.caption!.color!
                                      : Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.04,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    //  controller.PickMedium();
                                  },
                                  child: PriorityWidget(


                                    name: 'Medium'.tr,
                                      colour: controller.viewTask!.priority == 'medium'
                                          ? context.theme.primaryColor
                                          : context.theme.primaryColorLight,
                                     textColor: controller.viewTask!.priority == 'medium'
                                       ? context
                                       .theme.textTheme.caption!.color!
                                       : Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.04,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // controller.PickHigh();
                                  },
                                  child: PriorityWidget(


                                    name: 'High'.tr,
                                     colour: controller.viewTask!.priority == 'high'
                                        ? context.theme.primaryColor
                                        : context.theme.primaryColorLight,
                                    textColor: controller.viewTask!.priority == 'high'
                                      ? context
                                       .theme.textTheme.caption!.color!
                                      : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Text(
                      'Description'.tr,
                      style: TextStyle(
                        color: context.theme.textTheme.caption!.color!,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        elevation: 6,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          decoration: BoxDecoration(
                            color: context.theme.cardColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                Expanded(
                                  child: Text(
                                    controller.viewTask?.description !=null ?controller.viewTask?.description:
                                    'there is no description to this task'.tr,
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color:
                                      context.theme.textTheme.caption!.color!,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          controller.viewTask?.subtasksList !=[]? 'Subtasks'.tr:'',
                          style: TextStyle(
                            color: context.theme.textTheme.caption!.color!,
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            ShowAlert(context);
                          },
                          child: Icon(Icons.add,
                            size: 35,

                          ),
                        ),
                      ],
                    ),
                    // sub task text field

                    Center(
                      child: Column(
                        children: List.generate(

                           controller.viewTask!.subtasksList.length,
                                (index) => _subTaskWidget(

                              title: controller.viewTask?.subtasksList !=null?controller.viewTask!.subtasksList[index].name:'there is no subtasks to this task'.tr,
                            )),
                      ),
                    ),

                    SizedBox(
                      height: height * 0.03,
                    ),

                    Text(
                      controller.viewTask?.subtasksList!=[]?'':'Image '.tr,
                      style: TextStyle(
                        color: context.theme.textTheme.caption!.color!,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.25,
                          top: height * 0.02,
                          right: width * 0.25),
                      child: Container(
                        width: width * 0.5,
                        height: height * 0.2,
                        decoration: BoxDecoration(
                          color: context.theme.primaryColorLight,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [kBoxShadow],
                        ),
                        child: Image(image: AssetImage('images/joey.png')),

                      ),
                    ),
                    SizedBox(height: height*0.02,),
                  ],
                );

              })
            ),
          )),
    );
  }
}
//child: (controller.fileBool.value)
//  ? GestureDetector(
//  onTap: () {
//  controller.fileBool.value = false;
//   gellarypicker();
// },
// child: Image.file(_file1!))
// : Icon(
// Icons.add_a_photo,
// size: 50,
// color: context
//     .theme.textTheme.caption!.color!,
// ),
//   ),

class _subTaskWidget extends StatelessWidget {
  _subTaskWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: width * 0.5,
          decoration: BoxDecoration(
            color: context.theme.primaryColorLight,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                width * 0.05, width * 0.05, width * 0.05, width * 0.05),
            child: Text(
              title,
              style: TextStyle(
                color: context.theme.textTheme.caption!.color!,
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
