import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:plane_vite/constants.dart';
import 'package:plane_vite/screens/agenda/agenda_controller.dart';
import 'package:plane_vite/screens/to_do/to_do_controller.dart';
import 'package:plane_vite/widgets/custom_check_box.dart';
import '../../widgets/app_bar_no_drawer.dart';
import 'package:plane_vite/config/user_information.dart';

class AgendaScreen extends StatelessWidget {
 // TextEditingController taskDescriptionController = new TextEditingController();
  //TextEditingController taskNameController = new TextEditingController();
  //final ToDoController _todoController = Get.find();
  AgendaController _agendaController = Get.find();





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
                     // ShowAlert(context);
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
                  head: "Agenda".tr,
                  save: false,
                ),
              ),

              SizedBox(
                height: height * 0.01,
              ),





                 Text(
                  _agendaController.completedTasksInt.toString()+' of '.tr+_agendaController.personalList.length.toString(),

                  style: const TextStyle(fontFamily: 'HacenN',
                    color: kGrey,
                  ),
                );

              Divider(
                height: height * 0.06,
                endIndent: 1,
                thickness: 1,
                color: kGrey,
              ),
              Obx(() {
                if (_agendaController.isLoading.isTrue) {
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
                          _agendaController.personalList.length, (index) =>
                          _todo_item(index, _agendaController.personalList[index].completed)),
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
                        _todoController.personalList[index].deadline.toString(),
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
                                    style: TextStyle(fontFamily: 'HacenN',color: Colors.grey,
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

