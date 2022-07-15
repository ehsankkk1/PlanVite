import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plane_vite/constants.dart';
import 'package:plane_vite/screens/task/task_controller.dart';
import 'package:plane_vite/widgets/custom_check_box.dart';
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
      child: SafeArea(
          child: Obx(() {
            return Scaffold(
              backgroundColor: context.theme.backgroundColor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          width * 0.03, height * 0.025, width * 0.03,
                          height * 0.025),
                      child: AppBarWidgetNoDrawer(
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
                        ),),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 0,
                                top: 0,
                                right: width * 0.05),
                            child: TextField(
                              style: const TextStyle(color: Colors.black),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              cursorColor: kMainPink.value,
                              decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder:
                                const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: 'Add Title to this task'.tr,
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.05,),
                          Row(
                            children: [
                              Obx(() {
                                return CustomCheckbox(
                                  onTap: () {
                                    controller.PickApproved();
                                  },
                                  color: context.theme.textTheme.caption!
                                      .color!,

                                  size: 20,
                                  iconSize: 18,
                                  isSelected: controller.approved.value,
                                );
                              }),
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
                          SizedBox(height: height * 0.03,),
                          Row(
                            children: [
                              Obx(() {
                                return GestureDetector(
                                    onTap: () {
                                      controller.dateBool.value = false;
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2021),
                                        lastDate: DateTime(2023),
                                        builder: (context, child) =>
                                            Theme(
                                              data: ThemeData().copyWith(
                                                colorScheme: ColorScheme.dark(

                                                  primary: context.theme
                                                      .primaryColor,
                                                  onPrimary: context.theme
                                                      .textTheme.caption!
                                                      .color!,
                                                  surface: context.theme
                                                      .primaryColor,

                                                  onSurface: context.theme
                                                      .textTheme.caption!
                                                      .color!,

                                                ),
                                                // dialogBackgroundColor: Colors.white30,
                                              ),
                                              child: child!,
                                            ),
                                      ).then((date) {
                                        controller.year = date?.year.toString();
                                        controller.month =
                                            date?.month.toString();
                                        controller.day = date?.day.toString();

                                        controller.date = date.toString();

                                        controller.PickDate();
                                      });
                                    },
                                    child: Icon(
                                      Icons.date_range,
                                      color: controller.dateBool.value
                                          ? context.theme.primaryColor
                                          : kGrey,
                                    ));
                              }),
                              SizedBox(
                                width: width * 0.05,
                              ),
                              Obx(() {
                                return Text(
                                  controller.dateBool == false
                                      ? 'Due Date'.tr
                                      : '${controller.year}/${controller
                                      .month}/${controller.day}',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                );
                              }),
                            ],
                          ),

                          SizedBox(height: height * 0.03,),
                          Material(
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
                          ),
                          SizedBox(height: height * 0.03,),
                          Text(
                            'Fields'.tr,
                            style: TextStyle(
                              color: context.theme.textTheme.caption!.color!,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: height * 0.01,),
                          Material(
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
                                      width: width * 0.05,
                                    ),
                                    Text(
                                      'Priority'.tr,
                                      style: TextStyle(
                                        color: context.theme.textTheme.caption!
                                            .color!,
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
                                              ? context.theme.textTheme.caption!
                                              .color!
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
                                              ? context.theme.textTheme.caption!
                                              .color!
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
                                              ? context.theme.textTheme.caption!
                                              .color!
                                              : Colors.white,
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.03,),
                          Text(
                            'Description'.tr,
                            style: TextStyle(
                              color: context.theme.textTheme.caption!.color!,
                              fontSize: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.05,
                                top: 0,
                                right: width * 0.05),
                            child: TextField(
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              cursorColor: kMainPink.value,
                              decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder:
                                const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: 'Add More Details to this Task'.tr,
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.03,),
                          Text(
                            'Sub Tasks'.tr,
                            style: TextStyle(
                              color: context.theme.textTheme.caption!.color!,
                              fontSize: 17,
                            ),
                          ),
                          // sub task text field
                          Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.01, top: height * 0.001),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _taskController.addSubTask();
                                      _taskController.subTaskController.clear();
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: context.theme.primaryColor,
                                      size: 30,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      style: const TextStyle(
                                          color: Colors.black),
                                      controller: _taskController
                                          .subTaskController,
                                      cursorColor: context.theme.primaryColor,
                                      decoration: InputDecoration(
                                        focusedBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        hintText: 'Add Sub Task'.tr,
                                        hintStyle: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Obx(() {
                            return Center(
                              child: Column(
                                children: List.generate(_taskController.subTasks.length,
                                        (index) => _subTaskWidget(title: _taskController.subTasks[index],)
                                ),
                              ),
                            );
                          }),
                          SizedBox(height: height * 0.03,),
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
                                  boxShadow: [
                                    kBoxShadow
                                  ],
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
                                        child: Image.file(_file1!)) : Icon(
                                      Icons.add_a_photo,
                                      size: 50,
                                      color: context.theme.textTheme.caption!
                                          .color!,
                                    ),
                                  );
                                })),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
            );
          })
      ),
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
      padding:const EdgeInsets.symmetric(
          vertical: 10),
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: width*0.5,
          decoration: BoxDecoration(
            color: context.theme.primaryColorLight,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding:  EdgeInsets.fromLTRB(width * 0.05,width * 0.05,width * 0.05,width * 0.05),
            child: Flexible(
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
      ),
    );
  }
}
