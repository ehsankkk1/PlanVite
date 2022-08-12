import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:plane_vite/constants.dart';
import 'package:plane_vite/screens/to_do/to_do_controller.dart';
import 'package:plane_vite/widgets/custom_check_box.dart';
import '../../widgets/app_bar_no_drawer.dart';
import 'package:plane_vite/config/user_information.dart';

class ToDoScreen extends StatelessWidget {
  TextEditingController taskDescriptionController = new TextEditingController();
  TextEditingController taskNameController = new TextEditingController();
  final ToDoController _todoController = Get.find();

  void onClickAdd() async {
    EasyLoading.show(
      status: 'Loading...',
    );

    await _todoController.addTaskOnClick();
    if (_todoController.addTaskStatus) {
      EasyLoading.showSuccess(_todoController.message);
    } else {
      EasyLoading.showError(
        _todoController.message,
        duration: Duration(seconds: 10),
        dismissOnTap: true,
      );

      print('error here');
    }
  }

  void ShowAlert(BuildContext context) {
    var alertDialog = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      actions: [
        TextButton(
          onPressed: () {
            _todoController.description = taskDescriptionController.text;
            _todoController.name = taskNameController.text;
            onClickAdd();

            Navigator.pop(context);
          },
          child: Text(
            'Add'.tr,
            style: TextStyle(fontFamily: 'HacenN',
              color: context.theme.textTheme.caption!.color!,
            ),
          ),
        )
      ],
      backgroundColor: context.theme.backgroundColor,
      title: Center(
          child: Text(
            'Add Task'.tr,
            style: TextStyle(fontFamily: 'HacenN',
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
            style: TextStyle(fontFamily: 'HacenN',
              color: context.theme.canvasColor,
            ),
            controller: taskNameController,
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
              hintStyle: const TextStyle(fontFamily: 'HacenN',
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          TextField(
            style: TextStyle(fontFamily: 'HacenN',
              color: context.theme.canvasColor,
            ),
            controller: taskDescriptionController,
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
              hintStyle: const TextStyle(fontFamily: 'HacenN',

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
                      _todoController.dateBool.value = false;
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2021),
                        lastDate: DateTime(2023),
                        builder: (context, child) =>
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
                            ),
                      ).then((date) {
                        _todoController.year = date?.year.toString();
                        _todoController.month = date?.month.toString();
                        _todoController.day = date?.day.toString();

                        _todoController.date = date.toString();

                        _todoController.PickDate();
                      });
                    },
                    child: Icon(
                      Icons.date_range,
                      color:
                      _todoController.dateBool.value ? context.theme
                          .primaryColor : kGrey,
                    ));
              }),
              SizedBox(
                width: width * 0.05,
              ),
              Obx(() {
                return GestureDetector(
                  onTap: (){
                    _todoController.dateBool.value = false;
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2021),
                      lastDate: DateTime(2023),
                      builder: (context, child) =>
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
                          ),
                    ).then((date) {
                      _todoController.year = date?.year.toString();
                      _todoController.month = date?.month.toString();
                      _todoController.day = date?.day.toString();

                      _todoController.date = date.toString();

                      _todoController.PickDate();
                    });
                  },
                  child: Text(
                    _todoController.dateBool == false
                        ? 'Due Date'.tr
                        : _todoController.year == null ? 'Due Date'.tr
                        : '${_todoController.day}/${_todoController
                        .month}/${_todoController.year}',
                    style: const TextStyle(fontFamily: 'HacenN',
                      color: Colors.grey,
                      fontSize: 16,
                    ),
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
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          bottomNavigationBar: BottomAppBar(
            color: context.theme.cardColor,
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
                      color: context.theme.primaryColor,
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
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    width * 0.03, height * 0.025, width * 0.03, height * 0.025),
                child: AppBarWidgetNoDrawer(
                  head: "Personal Tasks".tr,
                  save: false,
                ),
              ),
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
                          progressColor: context.theme.primaryColor,
                          backgroundColor: context.theme.primaryColorLight,
                          radius: 45,
                          lineWidth: 4,
                          percent:
                          _todoController.count.toInt() / _todoController.doing.length,
                          center: GestureDetector(
                              onTap: () {
                                //controller.Calc();
                              },
                              child: Obx(() {
                                if (_todoController.isLoading.isTrue) {
                                  return CircularProgressIndicator(
                                    backgroundColor: context.theme.primaryColor,
                                    color: context.theme.cardColor,
                                  );
                                }
                                return  Text(
                                  '${(double.parse(_todoController.completedTasksToAll)*100).round().toString()}%',
                                  style: TextStyle(fontFamily: 'HacenN',
                                      fontSize: 14,
                                      color: context.theme.primaryColor,
                                      fontWeight: FontWeight.w900),
                                );

                              })
                          ),
                        );
                      }),
                    ],
                  ),
                  SizedBox(
                    width: width * 0.08,
                  ),
                  Text(
                    'My Tasks'.tr,
                    style: TextStyle(fontFamily: 'HacenN',
                      fontSize: 42,
                      color: context.theme.textTheme.caption!.color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              // '${_todoController.count.value
              //     .toString()} of ${_todoController.doing.length
              //     .toString()}'
              Obx(() {
                if (_todoController.isLoading2.isTrue) {
                  return const Text(
                      ''
                  );
                }
                return Text(
                   _todoController.completedTasksInt.toString()+' of '.tr+_todoController.personalList.length.toString(),

                  style: const TextStyle(fontFamily: 'HacenN',
                    color: kGrey,
                  ),
                );
              }),
              Divider(
                height: height * 0.06,
                endIndent: 1,
                thickness: 1,
                color: kGrey,
              ),
              Obx(() {
                if (_todoController.isLoading.isTrue) {
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.3,),
                        CircularProgressIndicator(
                          backgroundColor: context.theme.primaryColor,
                          color: context.theme.cardColor,
                        ),
                      ],
                    ),
                  );
                }
                return Expanded(
                  child: //Obx(() {
                  SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                          _todoController.personalList.length, (index) =>
                          _todo_item(index, _todoController.personalList[index].completed)),
                    ),

                  ),
                  // }),
                );
              })

            ],
          ),
        )

    );
  }
}

class _todo_item extends StatelessWidget {
  _todo_item(this.index, this.done);

  int index;
  bool done;

  @override
  Widget build(BuildContext context) {
    final ToDoController _todoController = Get.find();

    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.05,
          right: width * 0.05,
          bottom: height * 0.001,
          top: height * 0.01),
      child: HoldDetector(
        onHold: () {
          showDialog(context: context, builder: (context) =>
              AlertDialog(
                title: Center(
                  child: Column(

                    children: [
                      Text('Task Details : '.tr,
                        style: TextStyle(fontFamily: 'HacenN',color: context.theme.textTheme.caption!
                            .color),
                      ),
                      SizedBox(height: height * 0.05,),
                      Text(


                        _todoController.personalList[index].description == null
                            ? 'there is no description'.tr
                            : _todoController.personalList[index].description
                            .toString(),
                        style: TextStyle(fontFamily: 'HacenN',color: context.theme.textTheme.caption!
                            .color),
                      ),
                      SizedBox(height: height * 0.06,),
                      Text('Task Deadline : '.tr,
                        style: TextStyle(fontFamily: 'HacenN',color: context.theme.textTheme.caption!
                            .color),
                      ),
                      SizedBox(height: height * 0.05,),
                      Text(
                        DateFormat(_todoController.personalList[index].deadline.toString()).toString(),
                        style: TextStyle(fontFamily: 'HacenN',color: context.theme.textTheme.caption!
                            .color),
                      ),
                    ],
                  ),
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Text('rate user '.tr + '$index',),
                    // SizedBox(height: 30,),


                  ],
                ), actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: () {
                      Navigator.pop(context);
                    }, child: Text('Cancel'.tr,
                      style: TextStyle(fontFamily: 'HacenN',color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),),
                    TextButton(onPressed: () {
                      Navigator.pop(context);
                      showDialog(context: context, builder: (context) =>
                          AlertDialog(
                            title: Center(
                              child: Text(
                                'Are you sure you ant to delete this task ? '.tr
                                    .tr,
                                style: TextStyle(fontFamily: 'HacenN',
                                    color: context.theme.textTheme.caption!
                                        .color),
                              ),
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  TextButton(onPressed: () {
                                    Navigator.pop(context);
                                  }, child: Text('No'.tr,
                                    style: const
                                    TextStyle(fontFamily: 'HacenN',color: Colors.grey,
                                      fontSize: 18,
                                    ),
                                  ),),
                                  TextButton(onPressed: () {
                                    _todoController.DeleteTask(
                                        _todoController.personalList[index].id);
                                    Navigator.pop(context);
                                  }, child: Text('Yes'.tr,
                                    style: TextStyle(fontFamily: 'HacenN',
                                      color: context.theme.primaryColor,
                                      fontSize: 18,
                                    ),
                                  ),),

                                ],
                              )
                            ],
                          ));
                    }, child: Text('Delete Task'.tr,
                      style: TextStyle(fontFamily: 'HacenN',color: context.theme.primaryColor,
                        fontSize: 18,
                      ),
                    ),),
                  ],
                )
              ],
              ),);
        },
        child: Container(
          color: context.theme.backgroundColor,
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: width * 0.02,
                  ),

                 CustomCheckbox(

                    onTap: () {
                     // _todoController.isLoading2.value=true;

                      //controller.Done();
                     // _todoController.onTodoTap(index);
                      if(_todoController.personalList[index].completed){
                        _todoController.PutFalse('0',_todoController.personalList[index].id);
                      }
                      else if(_todoController.personalList[index].completed==false){
                        _todoController.PutTrue('1',_todoController.personalList[index].id);
                      }
                    },
                    size: 30,
                    iconSize: 25,
                    color: kGrey,
                    isSelected: done,
                   // isLoading: false,
                  ),
                  SizedBox(
                    width: width * 0.075,
                  ),
                  Flexible(
                    child: Text(
                      _todoController.personalList[index].name,
                      style: TextStyle(fontFamily: 'HacenN',
                        decoration: done
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,

                        fontSize: 15,
                        color: context.theme.textTheme.caption!.color,
                      ),
                    ),
                  ),

                ],
              ),
              const Divider(height: 90, thickness: 1, color: kGrey,),
            ],
          ),
        ),
      ),
    );
  }
}

