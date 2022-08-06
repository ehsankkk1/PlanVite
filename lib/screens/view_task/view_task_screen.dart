import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:plane_vite/constants.dart';

import 'package:plane_vite/screens/view_task/view_task_controller.dart';
import 'package:plane_vite/widgets/custom_check_box.dart';
import '../../widgets/app_bar_no_drawer.dart';
import '../../widgets/priorty_widget.dart';

class ViewTaskScreen extends StatelessWidget {
  ViewTaskController controller = Get.find();
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
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(width * 0.03, height * 0.025,
                        width * 0.03, height * 0.025),
                    child: AppBarWidgetNoDrawer(
                      visible: false,
                      head: "Personal Task",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        width * 0.03, height * 0.025, width * 0.03, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title'.tr,
                            style: TextStyle(
                              color: context.theme.textTheme.caption!.color!,
                              fontSize: 20,
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.1,
                      ),
                      CustomCheckbox(
                        onTap: () {
                          // controller.PickApproved();
                        },
                        color: context.theme.textTheme.caption!.color!,
                        size: 20,
                        iconSize: 18,
                        isSelected: true,
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Text(
                        'Approved'.tr,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.13,
                      ),
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
                      SizedBox(
                        width: width * 0.05,
                      ),

                      Text(
                        'date',
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
                                'Ehsan AdouRashed',
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
                                  textColor: Colors.black,
                                  colour: Colors.white,
                                  name: 'Low'.tr,
                                  // colour: controller.low == false
                                  //   ? context.theme.primaryColorLight
                                  //  : context.theme.primaryColor,
                                  // textColor: controller.low == false
                                  // ? context
                                  //  .theme.textTheme.caption!.color!
                                  //  : Colors.white,
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
                                  textColor: Colors.black,
                                  colour: Colors.white,
                                  name: 'Medium'.tr,
                                  //  colour: controller.medium == false
                                  //     ? context.theme.primaryColorLight
                                  //    : context.theme.primaryColor,
                                  // textColor: controller.medium == false
                                  //   ? context
                                  //  .theme.textTheme.caption!.color!
                                  //   : Colors.white,
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
                                  textColor: Colors.black,
                                  colour: Colors.white,
                                  name: 'High'.tr,
                                  // colour: controller.high == false
                                  //    ? context.theme.primaryColorLight
                                  //    : context.theme.primaryColor,
                                  //textColor: controller.high == false
                                  //  ? context
                                  //   .theme.textTheme.caption!.color!
                                  //  : Colors.white,
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
                                  'this task is made '.tr,
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
                  Text(
                    'Sub Tasks'.tr,
                    style: TextStyle(
                      color: context.theme.textTheme.caption!.color!,
                      fontSize: 20,
                    ),
                  ),
                  // sub task text field

                  Center(
                    child: Column(
                      children: List.generate(
                          _viewTaskController.subTasks.length,
                          (index) => _subTaskWidget(
                                title: _viewTaskController.subTasks[index],
                              )),
                    ),
                  ),

                  SizedBox(
                    height: height * 0.03,
                  ),
                  Text(
                    'Image'.tr,
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
              ),
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