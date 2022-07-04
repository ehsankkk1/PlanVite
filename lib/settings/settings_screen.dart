import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/constants.dart';
import 'package:plane_vite/settings/settings_controller.dart';
import 'package:plane_vite/widgets/custom_check_box.dart';

class SettingsScreen extends StatelessWidget {
  SettingsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: kBackGround,
        appBar: AppBar(
          backgroundColor: kBackGround,
          title: Center(
            child: Text(
              'Settings',
              style: TextStyle(
                color: kWritings,
              ),
            ),
          ),
        ),
        body: Container(
          //color: kMainPink,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Obx((){
              return Column(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        //color: kMainPink,
                        child: Container(
                          height: 70,
                          child: Stack(

                            children: [
                              Align(
                                alignment: Alignment(-1,-1),
                                child: Icon(

                                  Icons.language_sharp,
                                  color: kWritings,
                                  size: 45,
                                ),
                              ),
                              //SizedBox(width: 15,),
                              Align(
                                alignment: Alignment(-0.5,-0.85),
                                child: Text(
                                  'Language',
                                  style: TextStyle(
                                    color: kWritings,
                                    fontSize: 25,
                                  ),

                                ),
                              ),
                              //SizedBox(width: width*0.4,),
                              Align(
                                alignment: Alignment(0.8,-0.7),
                                child: GestureDetector(
                                  onTap: (){
                                    controller.isVisibleLang.value=!controller.isVisibleLang.value;
                                  },

                                  child: Icon(Icons.arrow_forward_ios,
                                    color: kWritings,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),

                      ),
                      //SizedBox(height: height*0.01,),
                      Visibility(
                        visible: controller.isVisibleLang.value,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 50,top: 15),
                          child: Column(
                            children: [
                              Stack(children: [

                                Align(
                                  alignment: Alignment(-0.45,0),
                                  child: Text('English',
                                    style: TextStyle(
                                      color: kWritings,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),

                                Align(
                                    alignment: Alignment.topRight,
                                    child: CustomCheckbox(onTap: (){}, color: kMainPink,size: 25,)),

                              ],),
                              SizedBox(height: height*0.01,),

                              Stack(


                                children: [
                                  //SizedBox(width: width*0.2,),
                                  Align(
                                    alignment: Alignment(-0.45,0),
                                    child: Text('العربية',
                                      style: TextStyle(
                                        color: kWritings,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  //SizedBox(width: width*0.437,),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: CustomCheckbox(onTap: (){}, color: kMainPink,size: 25,)),

                                ],),



                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        //color: kMainPink,
                        child: Container(
                          height: 70,
                          child: Stack(

                            children: [
                              Align(
                                alignment: Alignment(-1,-1),
                                child: Icon(

                                  Icons.palette_outlined,
                                  color: kWritings,
                                  size: 45,
                                ),
                              ),
                              //SizedBox(width: 15,),
                              Align(
                                alignment: Alignment(-0.5,-0.85),
                                child: Text(
                                  'Theme',
                                  style: TextStyle(
                                    color: kWritings,
                                    fontSize: 25,
                                  ),

                                ),
                              ),
                              //SizedBox(width: width*0.4,),
                              Align(
                                alignment: Alignment(0.8,-0.7),
                                child: GestureDetector(
                                  onTap: (){
                                    controller.isVisibleTheme.value=!controller.isVisibleTheme.value;
                                  },

                                  child: Icon(Icons.arrow_forward_ios,
                                    color: kWritings,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),

                      ),
                      //SizedBox(height: height*0.01,),
                      Visibility(
                        visible: controller.isVisibleTheme.value,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 50,top: 0),
                          child: Column(
                            children: [
                              Stack(children: [

                                Align(
                                  alignment: Alignment(-0.45,0),
                                  child: Text('Pink',
                                    style: TextStyle(
                                      color: kWritings,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),

                                Align(
                                    alignment: Alignment.topRight,
                                    child: CustomCheckbox(onTap: (){}, color: kMainPink,size: 25,)),

                              ],),
                              SizedBox(height: height*0.01,),

                              Stack(


                                children: [
                                  //SizedBox(width: width*0.2,),
                                  Align(
                                    alignment: Alignment(-0.45,0),
                                    child: Text('Dark',
                                      style: TextStyle(
                                        color: kWritings,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  //SizedBox(width: width*0.437,),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: CustomCheckbox(onTap: (){}, color: kMainPink,size: 25,)),

                                ],),
                              SizedBox(height: height*0.01,),
                              Stack(


                                children: [
                                  //SizedBox(width: width*0.2,),
                                  Align(
                                    alignment: Alignment(-0.42,0),
                                    child: Text('Purble',
                                      style: TextStyle(
                                        color: kWritings,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  //SizedBox(width: width*0.437,),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: CustomCheckbox(onTap: (){}, color: kMainPink,size: 25,)),

                                ],),
                              SizedBox(height: height*0.01,),
                              Stack(


                                children: [
                                  //SizedBox(width: width*0.2,),
                                  Align(
                                    alignment: Alignment(-0.45,0),
                                    child: Text('Blue',
                                      style: TextStyle(
                                        color: kWritings,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  //SizedBox(width: width*0.437,),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: CustomCheckbox(onTap: (){}, color: kMainPink,size: 25,)),

                                ],),

                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              );
            })
          ),



        ),

      ),
    );
  }
}
