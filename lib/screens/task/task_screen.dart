import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plane_vite/constants.dart';
import 'package:plane_vite/screens/task/task_controller.dart';
import 'package:intl/intl.dart' as Time;
import '../../widgets/app_bar_no_drawer.dart';
import '../../widgets/priorty_widget.dart';

class TaskScreen extends StatelessWidget {
  TaskController controller = Get.find();
  File? _file1;

  Future gellarypicker() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    _file1 = File(myfile!.path);
    if (_file1 != null) {
      controller.PickFile();
    }
  }

  @override
  Widget build(BuildContext context) {
    TaskController _taskController = Get.find();

    return Directionality(
      textDirection: TextDirection.ltr,
      child: SafeArea(child: Obx(() {
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(width * 0.03, height * 0.025,
                      width * 0.03, height * 0.025),
                  child: AppBarWidgetNoDrawer(
                    onSaveTap: (){
                      _taskController.editTaskTap(context);
                    },
                    head: "Task".tr,
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
                        style: TextStyle(fontFamily: 'HacenN',
                          color: context.theme.textTheme.caption!.color!,
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 0, top: 0, right: width * 0.05),
                        child: TextField(
                          style: const TextStyle(fontFamily: 'HacenN',color: Colors.black),
                          keyboardType: TextInputType.multiline,
                          controller: _taskController.taskTitleTextFieldController,
                          maxLines: null,
                          cursorColor: kMainPink.value,
                          decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: 'Add Title to this task'.tr,
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Obx(() {
                        return GestureDetector(
                            onTap: () async {
                              var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                                builder: (BuildContext context, Widget? child) {
                                  return
                                    Theme(
                                      data: ThemeData().copyWith(

                                        colorScheme: ColorScheme.dark(
                                          primary: context.theme.primaryColor,
                                          onPrimary: context.theme.textTheme
                                              .caption!.color!,
                                          surface: context.theme.primaryColor,

                                          onSurface: context.theme.textTheme
                                              .caption!.color!,

                                        ),
                                        dialogBackgroundColor: context.theme.hintColor,

                                      ),
                                      child: child!,
                                    );
                                },
                              );
                              if (date != null) {
                                _taskController.addTaskEndTime.value = date;
                              }
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.date_range,
                                  color:  context.theme.primaryColor,
                                ),
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                _taskController.addTaskEndTime.value == null
                                    ?Text(
                                  'Due Date'.tr,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                )
                                    :Text(
                                  Time.DateFormat.yMEd().format(_taskController.addTaskEndTime.value!),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            )
                        );
                      }),

                      SizedBox(
                        height: height * 0.03,
                      ),
                      GetBuilder<TaskController>(
                        assignId: true,
                        builder: (_taskController) {
                          return Container(
                            decoration: BoxDecoration(
                              color: context.theme.primaryColorLight,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                canvasColor: context.theme.primaryColorLight,
                              ),
                              child: DropdownButton(
                                hint:  Center(
                                    child: Text('Select User to Assign'.tr,
                                      style: TextStyle(color:context.theme.textTheme.caption!.color,fontFamily: 'HacenN',fontSize: 16),)),

                                underline: Container(

                                ),
                                menuMaxHeight: 225,
                                isExpanded: true,
                                borderRadius: BorderRadius.circular(10),

                                style: TextStyle(
                                    fontFamily: 'HacenN',
                                    color: context.theme.textTheme.caption!.color,
                                    fontSize: 16),
                                value: _taskController.allUserDropDownValue,
                                onChanged: (newValue) {
                                  print(newValue.toString());

                                  _taskController.setAllUserDropDownValue(int.parse(newValue.toString()));
                                },
                                items: _taskController.allProjectUsers.map((user) {
                                  return DropdownMenuItem(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundColor: context.theme
                                                .primaryColor,
                                            child:  CircleAvatar(
                                              radius: 20,
                                              backgroundColor: Colors.black12,
                                              foregroundImage: NetworkImage(user.image==null?"https://th.bing.com/th/id/OIP.QqThEN77e1aL9ps4M3mDGwAAAA?pid=ImgDet&w=220&h=220&c=7&dpr=1,88":user.image!),
                                            ),
                                          ),
                                          SizedBox(width: width*0.05,),
                                          Center(child: Text(user.name!)),
                                        ],
                                      ),
                                    ),
                                    value: user.id,
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Text(
                        'Fields'.tr,
                        style: TextStyle(
                          fontFamily: 'HacenN',
                          color: context.theme.textTheme.caption!.color!,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Material(
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
                                Obx(() {
                                  return GestureDetector(
                                    onTap: () {
                                      controller.PickLow();
                                    },
                                    child: PriorityWidget(
                                      name: 'Low'.tr,
                                      colour: controller.low == false
                                          ? context.theme.primaryColorLight
                                          : context.theme.primaryColor,
                                      textColor: controller.low == false
                                          ? context
                                              .theme.textTheme.caption!.color!
                                          : Colors.white,
                                    ),
                                  );
                                }),
                                SizedBox(
                                  width: width * 0.04,
                                ),
                                Obx(() {
                                  return GestureDetector(
                                    onTap: () {
                                      controller.PickMedium();
                                    },
                                    child: PriorityWidget(
                                      name: 'Medium'.tr,
                                      colour: controller.medium == false
                                          ? context.theme.primaryColorLight
                                          : context.theme.primaryColor,
                                      textColor: controller.medium == false
                                          ? context
                                              .theme.textTheme.caption!.color!
                                          : Colors.white,
                                    ),
                                  );
                                }),
                                SizedBox(
                                  width: width * 0.04,
                                ),
                                Obx(() {
                                  return GestureDetector(
                                    onTap: () {
                                      controller.PickHigh();
                                    },
                                    child: PriorityWidget(
                                      name: 'High'.tr,
                                      colour: controller.high == false
                                          ? context.theme.primaryColorLight
                                          : context.theme.primaryColor,
                                      textColor: controller.high == false
                                          ? context
                                              .theme.textTheme.caption!.color!
                                          : Colors.white,
                                    ),
                                  );
                                }),
                              ],
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
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.05, top: 0, right: width * 0.05),
                        child: TextField(
                          style: TextStyle(fontFamily: 'HacenN',color: Colors.black),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: _taskController.taskDescriptionTextFieldController,
                          cursorColor: kMainPink.value,
                          decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: 'Add More Details to this Task'.tr,
                            hintStyle: const TextStyle(fontFamily: 'HacenN',
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      // sub task text field
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Text(
                        'Image'.tr,
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
                            child: Obx(() {
                              return GestureDetector(
                                onTap: () {
                                  gellarypicker();
                                },
                                child: (controller.fileBool.value)
                                    ? GestureDetector(
                                        onTap: () {
                                          controller.fileBool.value = false;
                                          gellarypicker();
                                        },
                                        child: Image.file(_file1!))
                                    : Icon(
                                        Icons.add_a_photo,
                                        size: 50,
                                        color: context
                                            .theme.textTheme.caption!.color!,
                                      ),
                              );
                            })),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      })),
    );
  }
}

