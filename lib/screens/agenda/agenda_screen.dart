import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:intl/intl.dart';
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

                 Text(
                 'tap on the icon to unpin the task'.tr,
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



Obx((){
  if(_agendaController.isLoading.isFalse){

    return   Expanded(
      child:


      GridView.builder(
        itemCount: _agendaController.agendaList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 4,
        ),
        itemBuilder: (context, index) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HoldDetector(
              onHold:(){
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


                              _agendaController.agendaList[index].description == null
                                  ? 'there is no description'.tr
                                  : _agendaController.agendaList[index].description
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
                             DateFormat(_agendaController.agendaList[index].deadline.toString()).toString(),
                              style: TextStyle(fontFamily: 'HacenN',color: context.theme.textTheme.caption!
                                  .color),
                            ),
                          ],
                        ),
                      ),

                    ),);
              },

              child: Container(
                height: height*0.05,
                width: width,
                color: context.theme.backgroundColor,
                child: Row(

                  children: [

                    SizedBox(width: width * 0.08,),
                    GestureDetector(
                      onTap: (){
                        _agendaController.unPin(_agendaController.agendaList[index].id);
                      },
                      child: Icon(Icons.push_pin_rounded,
                        size: 25,
                        color: context.theme.primaryColor,
                      ),
                    ),
                    SizedBox(width: width * 0.15,),
                    Flexible(
                      child: Text(_agendaController.agendaList.isEmpty?'':_agendaController.agendaList[index].name.toString(),
                        style:   TextStyle(
                            fontSize: 18,
                            fontFamily: 'HacenN',color: context.theme.textTheme.caption!
                            .color),
                      ),
                    ),


                  ],
                ),

              ),
            ),
            Divider(
              height: height * 0.05,
              endIndent: 1,
              thickness: 1,
              color: kGrey,
            ),
          ],
        ),

      ),




      // }),
    );
  }
  return Center(
    child: Column(

      children: [
        SizedBox(height: height*0.3,),

        CircularProgressIndicator(

        ),
      ],
    ),
  );
})



            ],
          ),
        )

    );
  }
}



