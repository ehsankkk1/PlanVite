import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plane_vite/constants.dart';
import 'package:plane_vite/screens/task/task_controller.dart';
import 'package:plane_vite/widgets/custom_check_box.dart';



class TaskScreen extends StatelessWidget {
  TaskController controller = Get.find();
  File? _file1;



  Future gellarypicker() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    _file1 = File(myfile!.path);
    if(_file1 != null){
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
          body: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 0,right: width*0.75),
                        child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,
                          color: kMainPink,
                          size: 35,
                        ),),
                      ),
                      IconButton(onPressed: (){
                        print(_file1);

                      }, icon: Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Icon(Icons.done,
                          color: kMainPink,size: 35,
                        ),
                      ),),
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: width*0.07,top: height*0.01),
                    child: Text('Build Your Task',
                      style: TextStyle(
                          color: kWritings,
                          fontSize: 25
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: width*0.05,top: height*0.05),
                    child: Row(

                      children: [
                        Obx((){
                          return CustomCheckbox(onTap: (){
                            controller.PickApproved();
                          },
                            size: 25,
                            iconSize: 20,
                            isSelected: controller.approved.value,
                          );
                        }),

                        SizedBox(
                          width: width*0.03,
                        ),
                        Text('Approved',style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),)
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: width*0.07,top: height*0.04),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 300,
                        minWidth: 200,
                        maxHeight: 120,
                        minHeight: 60,
                      ),

                      //width: 250,
                      //height: 60,
                      decoration: BoxDecoration(
                        color: kColoredCard,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [BoxShadow(
                          color: Colors.grey.withOpacity(0.5), //color of shadow
                          spreadRadius: 5, //spread radius
                          blurRadius: 7, // blur radius
                          offset: Offset(0, 2), // changes position of shadow
                          //first paramerter of offset is left-right
                          //second parameter is top to down
                        ),],
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width*0.03,

                          ),
                          CircleAvatar(
                            radius: 27,
                            backgroundColor: kMainPink,
                            child: CircleAvatar(

                              radius: 25,
                              backgroundColor: Colors.black12,
                              foregroundImage: AssetImage('images/joey.png'),
                            ),
                          ),
                          SizedBox(width:width*0.01 ,),
                          Flexible(
                            child: Text('Ehsan abourshed',
                              style: TextStyle(
                                  color: kWritings,
                                  fontSize: 20
                              ),),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width*0.05,top: height*0.03),
                    child: Row(

                      children: [
                        Obx((){
                          return GestureDetector(

                              onTap: () {
                               controller.dateBool.value=false;
                                showDatePicker(

                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2021),
                                    lastDate: DateTime(2023),

                                  builder: (context,child)=> Theme(
                                    data: ThemeData().copyWith(
                                      colorScheme: ColorScheme.dark(
                                        primary: kMainPink,
                                        onPrimary: Colors.black,
                                        surface: kMainPink,
                                      ),
                                      dialogBackgroundColor: Colors.white30,
                                    ),
                                    child: child!,

                                  ),

                                )
                                    .then((date) {
                                      controller.year=date?.year.toString();
                                      controller.month=date?.month.toString();
                                      controller.day=date?.day.toString();




                                  controller.date=date.toString();

                                  controller.PickDate();



                                });
                              },

                              child: Icon(
                                Icons.date_range,
                                color:controller.dateBool.value ?  kMainPink:kGrey,
                              ));
                        }),


                        SizedBox(
                          width: width*0.03,
                        ),
                        Obx((){
                          return  Text(

                            controller.dateBool==false
                                ? 'Due Date'
                                :'${controller.year}/${controller.month}/${controller.day}',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),);
                        }),

                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width*0.05,top: height*0.04),
                    child: Text('Fields',style: TextStyle(
                      color: kWritings,
                      fontSize: 20,
                    ),),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(left: width*0.07,top: height*0.04),
                    child: Container(


                      width: width*0.9,
                      height: height*0.075,
                      decoration: BoxDecoration(
                        color: kColoredCard,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [BoxShadow(
                          color: Colors.grey.withOpacity(0.5), //color of shadow
                          spreadRadius: 5, //spread radius
                          blurRadius: 7, // blur radius
                          offset: Offset(0, 2), // changes position of shadow
                          //first paramerter of offset is left-right
                          //second parameter is top to down
                        ),],
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width*0.03,

                          ),
                          Text('Priorty',style: TextStyle(
                            color: kWritings,
                            fontSize: 17,
                          ),),
                          SizedBox(width:width*0.04 ,),
                          Obx((){
                            return GestureDetector(
                              onTap: (){
                                controller.PickLow();
                              },
                              child: Container(
                                width: width*0.18,
                                height: height*0.05,
                                decoration: BoxDecoration(
                                  color: controller.low==false?kLightPink:kMainPink,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [BoxShadow(
                                    color: Colors.grey.withOpacity(0.5), //color of shadow
                                    spreadRadius: 5, //spread radius
                                    blurRadius: 7, // blur radius
                                    offset: Offset(0, 2), // changes position of shadow
                                    //first paramerter of offset is left-right
                                    //second parameter is top to down
                                  ),],
                                ),
                                child: Center(
                                  child: Text('Low',style: TextStyle(
                                    color: kWritings,
                                    fontSize: 17,
                                  ),),
                                ),
                              ),
                            );
                          }),

                          SizedBox(width:width*0.04 ,),
                          Obx((){
                            return  GestureDetector(
                              onTap: (){
                                controller.PickMedium();
                              },
                              child: Container(
                                width: width*0.18,
                                height: height*0.05,
                                decoration: BoxDecoration(
                                  color: controller.medium==false?kLightPink:kMainPink,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [BoxShadow(
                                    color: Colors.grey.withOpacity(0.5), //color of shadow
                                    spreadRadius: 5, //spread radius
                                    blurRadius: 7, // blur radius
                                    offset: Offset(0, 2), // changes position of shadow
                                    //first paramerter of offset is left-right
                                    //second parameter is top to down
                                  ),],
                                ),
                                child: Center(
                                  child: Text('Medium',style: TextStyle(
                                    color: kWritings,
                                    fontSize: 17,
                                  ),),
                                ),
                              ),
                            );
                          }),

                          SizedBox(width:width*0.04 ,),
                          Obx((){
                            return  GestureDetector(
                              onTap: (){
                                controller.PickHigh();
                              },
                              child: Container(
                                width: width*0.18,
                                height: height*0.05,
                                decoration: BoxDecoration(
                                  color: controller.high==false?kLightPink:kMainPink,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [BoxShadow(
                                    color: Colors.grey.withOpacity(0.5), //color of shadow
                                    spreadRadius: 5, //spread radius
                                    blurRadius: 7, // blur radius
                                    offset: Offset(0, 2), // changes position of shadow
                                    //first paramerter of offset is left-right
                                    //second parameter is top to down
                                  ),],
                                ),
                                child: Center(
                                  child: Text('High',style: TextStyle(
                                    color: kWritings,
                                    fontSize: 17,
                                  ),),
                                ),
                              ),
                            );
                          }),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width*0.05,top: height*0.03),
                    child: Text('Description',style: TextStyle(
                      color: kWritings,
                      fontSize: 17,
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width*0.05,top: 0,right: width*0.05),
                    child: TextField(


                      cursorColor: kMainPink,
                      decoration: InputDecoration(

                        focusedBorder:UnderlineInputBorder(
                          borderSide:  BorderSide.none,

                        ),
                        enabledBorder: OutlineInputBorder(

                            borderSide: BorderSide.none
                             ),



                        hintText: 'Add More Details to this Task',

                        hintStyle: TextStyle(
                          color: Colors.grey,

                        ),

                      ),

                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width*0.05,top: height*0.03),
                    child: Text('Sub Tasks',style: TextStyle(
                      color: kWritings,
                      fontSize: 17,
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left:width*0.01,top: height*0.001),
                    child: Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.add,
                          color: kMainPink,
                          size: 30,

                        ),),
                        Expanded(
                          child: TextField(


                            cursorColor: kMainPink,
                            decoration: InputDecoration(

                              focusedBorder:UnderlineInputBorder(
                                borderSide:  BorderSide.none,

                              ),
                              enabledBorder: OutlineInputBorder(

                                  borderSide: BorderSide.none
                              ),



                              hintText: 'Sub Task',

                              hintStyle: TextStyle(
                                color: Colors.grey,

                              ),

                            ),

                          ),
                        ),
                      ],
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width*0.05,top: height*0.03),
                    child: Text('Image',style: TextStyle(
                      color: kWritings,
                      fontSize: 20,
                    ),),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: width*0.25,top: height*0.02,right: width*0.25),
                    child: Container(
                      width: width*0.5,
                      height: height*0.2,

                      decoration: BoxDecoration(
                        color: controller.high==false?kLightPink:kMainPink,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [BoxShadow(
                          color: Colors.grey.withOpacity(0.5), //color of shadow
                          spreadRadius: 5, //spread radius
                          blurRadius: 7, // blur radius
                          offset: Offset(0, 2), // changes position of shadow
                          //first paramerter of offset is left-right
                          //second parameter is top to down
                        ),],
                      ),
                      child: Obx((){
                        return GestureDetector(
                          onTap: (){
                            gellarypicker();
                          },
                          child: (controller.fileBool.value)
                              ? GestureDetector(
                              onTap: (){
                                controller.fileBool.value=false;
                                gellarypicker();
                              },
                              child: Image.file(_file1!))
                              : Icon(
                            Icons.add_a_photo,
                            size: 50,
                            color: kWritings,
                          ),
                        );
                      })

                    ),
                  ),
                  SizedBox(height: height*0.05,),
                ],
              ),
            ],
          ),

        ),
      ),
    );
  }
}
