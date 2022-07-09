import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:plane_vite/constants.dart';
import 'package:plane_vite/screens/to_do/to_do_controller.dart';
import 'package:plane_vite/widgets/custom_check_box.dart';

class ToDoScreen extends StatelessWidget {
  TextEditingController taskDescriptionController = new TextEditingController();
  TextEditingController taskNameController = new TextEditingController();
  ToDoController controller = Get.find();
  void ShowAlert(BuildContext context) {
    var alertDialog = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      actions: [
        TextButton(
          onPressed: () {
            controller.newTask = taskDescriptionController.text;
            Navigator.pop(context);
          },
          child: Text(
            'Add',
            style: TextStyle(
              color: kWritings.value,
            ),
          ),
        )
      ],
      backgroundColor: kBackGround.value,
      title: Center(
          child: Text(
        'Add Task',
        style: TextStyle(
          color: kWritings.value,
        ),
      )),
      content: Container(
        width: width * 0.7,
        height: height * 0.3,
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                TextField(
                  controller: taskNameController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  cursorColor: kMainPink.value,
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
                  controller: taskDescriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  cursorColor: kMainPink.value,
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
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.02,
                    ),
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
                                  colorScheme:  ColorScheme.dark(
                                    primary: kMainPink.value,
                                    onPrimary: kWritings.value,
                                    surface: kMainPink.value,

                                    onSurface: kWritings.value,
                                  ),
                                 // dialogBackgroundColor: Colors.white30,
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
                            color:
                                controller.dateBool.value ? kMainPink.value : kGrey,
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
                          fontSize: 16,
                        ),
                      );
                    }),
                  ],
                ),
                SizedBox(
                  height: height * 0.1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx((){
        return Scaffold(
          backgroundColor: kBackGround.value,
          appBar: AppBar(
            backgroundColor: kBackGround.value,
            actions: [
              IconButton(
                onPressed: () {
                  print(controller.newTask);
                },
                icon: Icon(Icons.done),
              )
            ],
            iconTheme: IconThemeData(
              color: kMainPink.value,
              size: 35,
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: kColoredCard.value,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text('Add',
                // style: TextStyle(
                //   color: kMainPink,
                //   //fontFamily: 'OleoScriptSwashCaps',
                //   fontSize: 20,
                //   fontWeight: FontWeight.w500,
                // ),
                // ),
                IconButton(
                    onPressed: () {
                      ShowAlert(context);
                    },
                    icon: Icon(
                      Icons.add,
                      color: kMainPink.value,
                      size: 35,
                    )),
                // Text('Task',
                // style: TextStyle(
                //   color: kMainPink,
                //   fontSize: 20,
                //   fontWeight: FontWeight.w500,
                //
                //   // fontFamily: 'OleoScriptSwashCaps',
                // ),
                // )
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top:30.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.06,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Obx(() {
                          return CircularPercentIndicator(
                            animation: true,
                            circularStrokeCap: CircularStrokeCap.round,
                            reverse: true,
                            progressColor: kMainPink.value,
                            backgroundColor: kLightPink.value,
                            radius: 45,
                            lineWidth: 4,
                            percent:
                            controller.count.toInt() / controller.doing.length,
                            center: GestureDetector(
                              onTap: () {
                                //controller.Calc();
                              },
                              child: Text(
                                '${controller.percent.value.toString()}%',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: kMainPink.value,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                    SizedBox(
                      width: width * 0.08,
                    ),
                    Text(
                      'My Tasks',
                      style: TextStyle(
                        fontSize: 42,
                        color: kWritings.value,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Obx(() {
                  return Text(
                    '${controller.count.value.toString()} of ${controller.doing.length.toString()}',
                    style: TextStyle(
                      color: kGrey,
                    ),
                  );
                }),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.22),
                  child: Divider(
                    height: height * 0.06,
                    endIndent: 1,
                    thickness: 1,
                    color: kGrey,
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                      itemCount: 7,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 4,
                      ),
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.05,
                            right: width * 0.05,
                            bottom: height * 0.001,
                            top: height * 0.01),
                        child: Container(
                          color: kBackGround.value,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  Obx(() {
                                    return CustomCheckbox(
                                      onTap: () {
                                        //controller.Done();
                                        controller.Doing(index);
                                        if (controller.doing[index].value) {
                                          controller.count.value++;
                                          controller.percent.value =
                                              (controller.count.toInt() /
                                                  controller
                                                      .doing.length *
                                                  100)
                                                  .toInt()
                                                  .toString();
                                        } else {
                                          controller.count.value--;
                                          controller.percent.value =
                                              (controller.count.toInt() /
                                                  controller
                                                      .doing.length *
                                                  100)
                                                  .toInt()
                                                  .toString();
                                        }
                                      },
                                      size: 30,
                                      iconSize: 25,
                                      color: kGrey,
                                      isSelected:
                                      controller.doing[index].value,
                                    );
                                  }),
                                  SizedBox(
                                    width: width * 0.075,
                                  ),
                                  Obx((){
                                    return  Flexible(
                                      child: Text(
                                        'Need to study Data Base',
                                        style: TextStyle(
                                          decoration: controller.doing[index].value ?TextDecoration.lineThrough:TextDecoration.none,

                                          fontSize: 15,
                                          color: kWritings.value,
                                        ),
                                      ),
                                    );
                                  }),

                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        );
      })
    );
  }
}
