import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plane_vite/constants.dart';
import 'package:plane_vite/screens/task/task_controller.dart';
import 'package:plane_vite/widgets/custom_check_box.dart';

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
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kBackGround,
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back,
                          color: kMainPink,
                          size: 35,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          print(_file1);
                        },
                        icon: Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.done,
                            color: kMainPink,
                            size: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(width * 0.03, height * 0.025, width * 0.03, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Build Your Task'.tr,
                            style: TextStyle(color: kWritings, fontSize: 20),
                          ),
                          SizedBox(height: height*0.05,),
                          Row(
                            children: [
                              Obx(() {
                                return CustomCheckbox(
                                  onTap: () {
                                    controller.PickApproved();
                                  },
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
                          SizedBox(height: height*0.03,),
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
                                        builder: (context, child) => Theme(
                                          data: ThemeData().copyWith(
                                            colorScheme: const ColorScheme.dark(
                                              primary: kMainPink,
                                              onPrimary: Colors.black,
                                              surface: kMainPink,
                                            ),
                                            dialogBackgroundColor: Colors.white30,
                                          ),
                                          child: child!,
                                        ),
                                      ).then((date) {
                                        controller.year = date?.year.toString();
                                        controller.month = date?.month.toString();
                                        controller.day = date?.day.toString();

                                        controller.date = date.toString();

                                        controller.PickDate();
                                      });
                                    },
                                    child: Icon(
                                      Icons.date_range,
                                      color: controller.dateBool.value
                                          ? kMainPink
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
                                      : '${controller.year}/${controller.month}/${controller.day}',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                );
                              }),
                            ],
                          ),

                          SizedBox(height: height*0.03,),
                          Container(
                            constraints: const BoxConstraints(
                              maxWidth: 300,
                              minWidth: 200,
                              maxHeight: 120,
                              minHeight: 60,
                            ),
                            //width: 250,
                            //height: 60,
                            decoration: BoxDecoration(
                              color: kColoredCard,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                kBoxShadow
                              ],
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundColor: kMainPink,
                                  child: CircleAvatar(
                                    radius: 19,
                                    backgroundColor: Colors.black12,
                                    foregroundImage: AssetImage('images/joey.png'),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                const Flexible(
                                  child: Text(
                                    'Ehsan abourshed',
                                    style: TextStyle(color: kWritings, fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: height*0.03,),
                          Text(
                            'Fields'.tr,
                            style: const TextStyle(
                              color: kWritings,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: height*0.01,),
                          Container(
                            width: width * 0.9,
                            height: height * 0.065,
                            decoration: BoxDecoration(
                              color: kColoredCard,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                kBoxShadow
                              ],
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                Text(
                                  'Priority'.tr,
                                  style: const TextStyle(
                                    color: kWritings,
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
                                      name:'Low'.tr,
                                      colour:controller.low == false ? kLightPink : kMainPink,
                                      textColor:controller.low == false ? kWritings : Colors.white,
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
                                      name:'Medium'.tr,
                                      colour:controller.medium == false ? kLightPink : kMainPink,
                                      textColor:controller.medium == false ? kWritings : Colors.white,
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
                                      name:'High'.tr,
                                      colour:controller.high == false ? kLightPink : kMainPink,
                                      textColor:controller.high == false ? kWritings : Colors.white,
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                          SizedBox(height: height*0.03,),
                          Text(
                            'Description'.tr,
                            style: const TextStyle(
                              color: kWritings,
                              fontSize: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.05, top: 0, right: width * 0.05),
                            child: TextField(
                              cursorColor: kMainPink,
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
                          ),
                          SizedBox(height: height*0.03,),
                          Text(
                            'Sub Tasks'.tr,
                            style: const TextStyle(
                              color: kWritings,
                              fontSize: 17,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.01, top: height * 0.001),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add,
                                      color: kMainPink,
                                      size: 30,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      cursorColor: kMainPink,
                                      decoration: InputDecoration(
                                        focusedBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        hintText: 'Sub Task'.tr,
                                        hintStyle: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(height: height*0.03,),
                          Text(
                            'Image'.tr,
                            style: const TextStyle(
                              color: kWritings,
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
                                  color: kLightPink,
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
                                            child: Image.file(_file1!))
                                        : const Icon(
                                            Icons.add_a_photo,
                                            size: 50,
                                            color: kWritings,
                                          ),
                                  );
                                })),
                          ),
                        ],
                      ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
