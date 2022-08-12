import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as Time;
import 'package:plane_vite/constants.dart';
import 'package:plane_vite/screens/view_task/view_task_controller.dart';
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
                      save: false,
                      visible: true,
                      head: controller.viewTask!.name,
                      onBackTap: (){
                        Get.back();
                      },
                    ),
                  ),

                  SizedBox(
                    height: height * 0.03,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(

                        'Deadline : ${Time.DateFormat.yMEd().format(controller.viewTask!.deadline!)}',
                        style: const TextStyle(fontFamily: 'HacenN',
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: height * 0.03,
                  ),


                  Text(
                    'The task is assigned to : '.tr,
                    style: TextStyle(fontFamily: 'HacenN',
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
                                child:  CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.black12,
                                  foregroundImage:
                                  NetworkImage(_viewTaskController.viewTask?.assigneeInfo?.image==null?'https://th.bing.com/th/id/OIP.QqThEN77e1aL9ps4M3mDGwAAAA?pid=ImgDet&w=220&h=220&c=7&dpr=1,88':_viewTaskController.viewTask!.assigneeInfo!.image!),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.05,
                              ),
                              Text(
                                controller.viewTask!.assigneeInfo != null
                                    ? controller.viewTask!.assigneeInfo!.name!
                                    : 'Task for all users',
                                style: TextStyle(fontFamily: 'HacenN',
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
                    style: TextStyle(fontFamily: 'HacenN',
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
                                style: TextStyle(fontFamily: 'HacenN',
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
                                  colour: controller.viewTask!.priority == 'low'
                                      ? context.theme.primaryColor
                                      : context.theme.primaryColorLight,
                                  textColor: controller.viewTask!.priority ==
                                      'low'
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
                                  colour: controller.viewTask!.priority ==
                                      'medium'
                                      ? context.theme.primaryColor
                                      : context.theme.primaryColorLight,
                                  textColor: controller.viewTask!.priority ==
                                      'medium'
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
                                  colour: controller.viewTask!.priority ==
                                      'high'
                                      ? context.theme.primaryColor
                                      : context.theme.primaryColorLight,
                                  textColor: controller.viewTask!.priority ==
                                      'high'
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
                    style: TextStyle(fontFamily: 'HacenN',
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
                                  controller.viewTask!.description ??
                                      'there is no description to this task'.tr,
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontFamily: 'HacenN',
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
                        controller.viewTask?.subtasksList != []
                            ? 'Subtasks'.tr
                            : '',
                        style: TextStyle(fontFamily: 'HacenN',
                          color: context.theme.textTheme.caption!.color!,
                          fontSize: 20,
                        ),
                      ),
                      controller.viewTask!.isAdmin! || controller.viewTask!.isMyTask!
                          ?GestureDetector(
                        onTap: () {
                          controller.addSubTaskDialog(context);
                        },
                        child: Icon(Icons.add,
                          size: 35,

                        ),
                      )
                          :Container(),
                    ],
                  ),
                  // sub task text field

                  GetBuilder<ViewTaskController>(
                      builder: (logic) {
                        return Center(
                          child: Column(
                            children: List.generate(
                                controller.viewTask!.subtasksList!.length,
                                    (index) =>
                                    _subTaskWidget(
                                      title: controller.viewTask!
                                          .subtasksList![index].name
                                          ?? 'there is no subtasks to this task'.tr,
                                    )),
                          ),
                        );
                      }),

                  SizedBox(
                    height: height * 0.03,
                  ),

                  Text(
                    controller.viewTask?.subtasksList != [] ? '' : 'Image '.tr,
                    style: TextStyle(fontFamily: 'HacenN',
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
                      child: controller.viewTask!.imageUrl != null
                          ?Image(image: NetworkImage(controller.viewTask!.imageUrl!))
                          :Icon(Icons.camera_enhance_outlined),

                    ),
                  ),
                  SizedBox(height: height * 0.02,),
                ],
              ),

            ),
          )),
    );
  }
}


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
            color: context.theme.cardColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                width * 0.05, width * 0.05, width * 0.05, width * 0.05),
            child: Text(
              title,
              style: TextStyle(fontFamily: 'HacenN',
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
