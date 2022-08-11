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
                 'tasks',
                  style: const TextStyle(fontFamily: 'HacenN',
                    color: kGrey,
                  ),
                ),

              Divider(
                height: height * 0.06,
                endIndent: 1,
                thickness: 1,
                color: kGrey,
              ),




                 Expanded(
                  child: Obx((){
                    if(_agendaController.isLoading.isFalse){

                      return  GridView.builder(
                          itemCount: 2,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 4,
                          ),
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.05,
                                right: width * 0.05,
                                bottom: height * 0.001,
                                top: height * 0.001),
                            child: Container(
                              color: context.theme.backgroundColor,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: width * 0.02,
                                      ),

                                      SizedBox(
                                        width: width * 0.02,
                                      ),

                                    ],
                                  ),
                                  Divider(
                                    height: height * 0.02,
                                    endIndent: 1,
                                    thickness: 1.5,
                                    color: context.theme.primaryColor,
                                  )
                                ],
                              ),
                            ),
                          ));
                    }
                    return CircularProgressIndicator();
                  })

                  // }),
                ),


            ],
          ),
        )

    );
  }
}

class _agenda_item extends StatelessWidget {
  _agenda_item(this.index, this.pinned);

  int index;
  bool pinned;

  @override
  Widget build(BuildContext context) {
    final AgendaController _agendaController = Get.find();

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


                       // _agendaController.personalList[index].description == null
                             'there is no description'.tr,
                           // : _agendaController.personalList[index].description
                           // .toString(),
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
                       // _agendaController.personalList[index].deadline.toString(),
                        'deadline',
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


                  SizedBox(
                    width: width * 0.075,
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

