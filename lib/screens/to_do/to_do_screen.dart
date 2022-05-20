import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:plane_vite/constants.dart';
import 'package:plane_vite/screens/to_do/to_do_controller.dart';
import 'package:plane_vite/widgets/custom_check_box.dart';

class ToDoScreen extends StatelessWidget {
  ToDoController controller = Get.find();
  void ShowAlert(BuildContext context){
    var alertDialog=AlertDialog(
      title: Text('add task'),
      content: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: null,

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
    );
    showDialog(context: context,
        builder: (BuildContext){
      return alertDialog;
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackGround,
        appBar: AppBar(
          backgroundColor: kBackGround,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.done),)
          ],
          iconTheme: IconThemeData(
            color: kMainPink,
            size: 35,

          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: kColoredCard,

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

                  onPressed: (){
ShowAlert(context);

                  },
                  icon:Icon(Icons.add,
                    color: kMainPink,
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
          Align(
              alignment: Alignment(1, -1),
              child: Image(
                image: AssetImage('images/log_in_flower.png'),
              )),

          Row(
            children: [
              SizedBox(width: width*0.06,),
              Column(
                children: [
                  SizedBox(height: height*0.015,),
                  Obx((){
                    return  CircularPercentIndicator(
                      animation: true,
                      circularStrokeCap: CircularStrokeCap.round,
                      reverse: true,
                      progressColor: kMainPink,
                      backgroundColor: kLightPink,
                      radius: 45,
                      lineWidth: 4,
                      percent: controller.count.toInt()/controller.doing.length,
                      center: GestureDetector(
                        onTap: (){
                          //controller.Calc();
                        },
                        child:  Text(
                          '${controller.percent.value.toString()}%',
                          style: TextStyle(
                              fontSize: 14,
                              color: kMainPink,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    );
                  }),

                ],
              ),
              SizedBox(width: width*0.08,),
              Text('My Tasks',
                style: TextStyle(
                  fontSize: 42,
                 color: kWritings,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
SizedBox(height: height*0.01,),
          Obx((){
            return Text('${controller.count.value.toString()} of ${controller.doing.length.toString()}',
              style: TextStyle(
                color: kGrey,
              ),
            );
          }),

          Padding(
            padding: EdgeInsets.only(left: width*0.22),
            child: Divider(
              height: height * 0.06,
              endIndent: 1,
              thickness: 1,
              color:kGrey,
            ),
          ),
          Expanded(
            child: Container(

              child: GridView.builder(
                  itemCount: 7,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                      color: kBackGround,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: width * 0.02,
                              ),
                                   Obx((){
                                     return CustomCheckbox(onTap: (){
                                       //controller.Done();
                                       controller.Doing(index);
                                       if(controller.doing[index].value){
                                         controller.count.value++;
                                         controller.percent.value=(controller.count.toInt()/controller.doing.length*100).toInt().toString();


                                       }
                                       else {
                                         controller.count.value--;
                                         controller.percent.value=(controller.count.toInt()/controller.doing.length*100).toInt().toString();


                                       }

                                     },
                                       size: 30,
                                       iconSize: 25,
                                       color: kGrey,
                                       isSelected: controller.doing[index].value,

                                     );
                                   }),




                              SizedBox(
                                width: width * 0.075,
                              ),
                              Flexible(
                                child: Text(
                                  'Need to study Data Base',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: kWritings,
                                  ),
                                ),
                              )
                            ],
                          ),

                        ],
                      ),
                    ),
                  )),
            ),
          ),

        ],
        ),


      ),
    );
  }
}
