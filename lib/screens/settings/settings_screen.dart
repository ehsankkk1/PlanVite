import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/constants.dart';
import 'package:plane_vite/screens/settings/settings_controller.dart';
import 'package:plane_vite/storage/secure_storage.dart';
import 'package:plane_vite/widgets/custom_check_box.dart';

import '../../config/theme_service.dart';

class SettingsScreen extends StatelessWidget {
  SettingsController controller = Get.find();
SecureStorage storage = SecureStorage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
         Scaffold(

          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            backgroundColor: context.theme.backgroundColor,
            title: Center(
              child: Text(
                'Settings'.tr,
                style: TextStyle(
                  color: context.theme.textTheme.caption!.color,
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
                                      color: context.theme.textTheme.caption!.color,
                                      size: 45,
                                    ),
                                  ),
                                  //SizedBox(width: 15,),
                                  Align(
                                    alignment: Alignment(-0.5,-0.85),
                                    child: Text(
                                      'Language'.tr,
                                      style: TextStyle(
                                        color: context.theme.textTheme.caption!.color,
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
                                        color: context.theme.textTheme.caption!.color,
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
                                          color: context.theme.textTheme.caption!.color,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),


                                       Obx((){
                                         return Align(
                                             alignment: Alignment.topRight,
                                             child: CustomCheckbox(onTap: (){
                                               storage.save('lang', 'en');
                                               controller.selectedLang='en';
                                               controller.changeToEn();


                                               Get.updateLocale(
                                                   Locale(controller.selectedLang));

                                             }, color: context.theme.primaryColor,size: 25,isSelected: controller.lang.value=='en'?true:false,));
                                       })


                                  ],),
                                  SizedBox(height: height*0.01,),

                                  Stack(


                                    children: [
                                      //SizedBox(width: width*0.2,),
                                      Align(
                                        alignment: Alignment(-0.45,0),
                                        child: Text('العربية',
                                          style: TextStyle(
                                            color: context.theme.textTheme.caption!.color,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      //SizedBox(width: width*0.437,),

                                         Obx((){
                                           return Align(
                                               alignment: Alignment.topRight,
                                               child: CustomCheckbox(onTap: (){
                                                 storage.save('lang', 'ar');
                                                 controller.selectedLang='ar';
                                                 controller.changeToAr();
                                                 Get.updateLocale(
                                                     Locale(controller.selectedLang));

                                               }, color: context.theme.primaryColor,size: 25,isSelected: controller.lang.value=='ar'?true:false,));
                                         })


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
                                      color: context.theme.textTheme.caption!.color,
                                      size: 45,
                                    ),
                                  ),
                                  //SizedBox(width: 15,),
                                  Align(
                                    alignment: Alignment(-0.5,-0.85),
                                    child: Text(
                                      'Theme'.tr,
                                      style: TextStyle(
                                        color: context.theme.textTheme.caption!.color,
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
                                        color: context.theme.textTheme.caption!.color,
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
                                      child: Text('Pink'.tr,
                                        style: TextStyle(
                                          color: context.theme.textTheme.caption!.color,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),

                                   Obx((){
                                     return  Align(
                                         alignment: Alignment.topRight,
                                         child: CustomCheckbox(onTap: (){

                                           //controller.isPink.value=true;
                                           //controller.isDark.value=false;
                                           controller.changeToPink();
                                           Get.changeThemeMode(ThemeMode.light);
                                           ThemeService().switchTheme;

                                         }, color:context.theme.primaryColor,size: 25,isSelected: controller.isPink.value, ));
                                   })

                                  ],),
                                  SizedBox(height: height*0.01,),

                                  Stack(


                                    children: [
                                      //SizedBox(width: width*0.2,),
                                      Align(
                                        alignment: Alignment(-0.45,0),
                                        child: Text('Dark'.tr,
                                          style: TextStyle(
                                            color: context.theme.textTheme.caption!.color,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      //SizedBox(width: width*0.437,),

                                        Obx((){
                                          return  Align(
                                              alignment: Alignment.topRight,
                                              child: CustomCheckbox(onTap: (){

                                                // controller.isDark.value=true;
                                                // controller.isPink.value=false;
                                                controller.changeToDark();
                                                Get.changeThemeMode(ThemeMode.dark);
                                                ThemeService().switchTheme;


                                              }, color: context.theme.primaryColor,size: 25, isSelected: controller.isDark.value,));
                                        })



                                    ],),
                                  SizedBox(height: height*0.01,),
                                  Stack(


                                    children: [
                                      //SizedBox(width: width*0.2,),
                                      Align(
                                        alignment: Alignment(-0.42,0),
                                        child: Text('Purple',
                                          style: TextStyle(
                                            color: context.theme.textTheme.caption!.color,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      //SizedBox(width: width*0.437,),
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: CustomCheckbox(onTap: (){}, color: context.theme.primaryColor,size: 25,)),

                                    ],),
                                  SizedBox(height: height*0.01,),
                                  Stack(


                                    children: [
                                      //SizedBox(width: width*0.2,),
                                      Align(
                                        alignment: Alignment(-0.45,0),
                                        child: Text('Blue',
                                          style: TextStyle(
                                            color: context.theme.textTheme.caption!.color,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      //SizedBox(width: width*0.437,),
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: CustomCheckbox(onTap: (){}, color: context.theme.primaryColor,size: 25,)),

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

        )

    );
  }
}
