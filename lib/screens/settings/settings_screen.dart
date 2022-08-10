import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:plane_vite/constants.dart';
import 'package:plane_vite/screens/settings/settings_controller.dart';
import 'package:plane_vite/storage/secure_storage.dart';
import 'package:plane_vite/widgets/custom_check_box.dart';

import '../../config/theme_service.dart';
import '../../widgets/loader_screen.dart';

class SettingsScreen extends StatelessWidget {
  SettingsController controller = Get.find();
SecureStorage storage = SecureStorage();
  void onClickLogOut() async {
    /*    EasyLoading.show(
      status: 'Loading...',
    );*/
    Get.defaultDialog(
        title: 'Loading...',
        titleStyle: TextStyle(color: kWritings.value,fontSize: 25),
        content: LoaderScreen(),
        backgroundColor: kBackGround.value
    );

    await controller.logOutOnClick();
   // Get.back();
    if (controller.logOutStatus) {
      Get.offAllNamed('/login');
      // EasyLoading.dismiss(animation: true);
      //Get.offNamed('/login');
      //EasyLoading.showSuccess(message);
    } else {
      Get.defaultDialog(
          title: controller.message,
          titleStyle: TextStyle(color: kWritings.value,fontSize: 25),
          content: LoaderScreen(error: true,),
          backgroundColor: kBackGround.value
      );
      /* EasyLoading.showError(
        message,
        duration: const Duration(seconds: 10),
        dismissOnTap: true,
      );*/


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
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(fontFamily: 'HacenN',
              color: context.theme.textTheme.caption!.color!,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(width: width*0.35,),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onClickLogOut();
          },
          child: Text(
            'Yes',
            style: TextStyle(fontFamily: 'HacenN',
              color: context.theme.textTheme.caption!.color!,
              fontSize: 18,
            ),
          ),
        ),

      ],
      backgroundColor: context.theme.backgroundColor,
      title: Center(
          child: Text(
            'are you sure you want to log out ? ',
            style: TextStyle(fontFamily: 'HacenN',
              color: context.theme.textTheme.caption!.color!,
            ),
          )),
      content: Container(
        width: width * 0.7,
        height: height * 0.04,

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
      child:
         Scaffold(

          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            backgroundColor: context.theme.backgroundColor,
            title: Center(
              child: Text(
                'Settings'.tr,
                style: TextStyle(fontFamily: 'HacenN',
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
                              height:height*0.07,
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
                                      style: TextStyle(fontFamily: 'HacenN',
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
                                        style: TextStyle(fontFamily: 'HacenN',
                                          color: context.theme.textTheme.caption!.color,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),


                                       Obx((){
                                         return Align(
                                             alignment: Alignment.topRight,
                                             child: CustomCheckbox(onTap: (){

                                               controller.storeLangAr(false);
                                               controller.changeToEn();


                                               Get.updateLocale(
                                                   Locale('en'));

                                             }, color: context.theme.primaryColor,size: 25,isSelected: controller.isAr.value==true?false:true,));
                                       })


                                  ],),
                                  SizedBox(height: height*0.01,),

                                  Stack(


                                    children: [
                                      //SizedBox(width: width*0.2,),
                                      Align(
                                        alignment: Alignment(-0.45,0),
                                        child: Text('العربية',
                                          style: TextStyle(fontFamily: 'HacenN',
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

                                                 controller.storeLangAr(true);
                                                 controller.changeToAr();
                                                 Get.updateLocale(
                                                     Locale('ar'));

                                               }, color: context.theme.primaryColor,size: 25,isSelected: controller.isAr.value,));
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
                              height:height*0.07,
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
                                      style: TextStyle(fontFamily: 'HacenN',
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
                                        style: TextStyle(fontFamily: 'HacenN',
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
                                           controller.storeThemeSetting1(false);
                                           controller.storeThemeSetting(true);
                                           controller.storeThemeSetting3(false);
                                           controller.storeThemeSetting2(false);
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
                                          style: TextStyle(fontFamily: 'HacenN',
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
                                                controller.storeThemeSetting1(true);
                                                controller.storeThemeSetting(false);
                                                controller.storeThemeSetting3(false);
                                                controller.storeThemeSetting2(false);
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
                                        child: Text('Purple'.tr,
                                          style: TextStyle(fontFamily: 'HacenN',
                                            color: context.theme.textTheme.caption!.color,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      //SizedBox(width: width*0.437,),
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: CustomCheckbox(onTap: (){
                                            controller.changeToPurple();

                                            controller.storeThemeSetting1(false);
                                            controller.storeThemeSetting(false);
                                            controller.storeThemeSetting3(false);
                                            controller.storeThemeSetting2(true);
                                            Get.changeThemeMode(ThemeMode.dark);
                                            ThemeService().switchTheme;


                                          }, color: context.theme.primaryColor,size: 25,isSelected: controller.isPurple.value,)),

                                    ],),
                                  SizedBox(height: height*0.01,),
                                  Stack(


                                    children: [
                                      //SizedBox(width: width*0.2,),
                                      Align(
                                        alignment: Alignment(-0.45,0),
                                        child: Text('Blue'.tr,
                                          style: TextStyle(fontFamily: 'HacenN',
                                            color: context.theme.textTheme.caption!.color,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      //SizedBox(width: width*0.437,),
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: CustomCheckbox(onTap: (){

                                            controller.changeToBlue();
                                            controller.storeThemeSetting3(true);
                                            controller.storeThemeSetting1(false);
                                            controller.storeThemeSetting(false);
                                            controller.storeThemeSetting2(false);
                                            Get.changeThemeMode(ThemeMode.dark);
                                            ThemeService().switchTheme;

                                          }, color: context.theme.primaryColor,size: 25, isSelected: controller.isBlue.value,)),

                                    ],),

                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: height*0.01,),
                          Container(
                            height:height*0.07,
                            child: Stack(

                              children: [
                                Align(
                                  alignment: Alignment(-1,-1),
                                  child: Icon(

                                    Icons.help_outline,
                                    color: context.theme.textTheme.caption!.color,
                                    size: 45,
                                  ),
                                ),
                                //SizedBox(width: 15,),
                                Align(
                                  alignment: Alignment(-0.5,-0.85),
                                  child: Text(
                                    'About'.tr,
                                    style: TextStyle(fontFamily: 'HacenN',
                                      color: context.theme.textTheme.caption!.color,
                                      fontSize: 25,
                                    ),

                                  ),
                                ),
                                //SizedBox(width: width*0.4,),


                              ],
                            ),
                          ),
                          SizedBox(height: height*0.01,),
                          GestureDetector(
                            onTap: (){
                              ShowAlert(context);
                            },
                            child: Container(
                              height:height*0.07,
                              child: Stack(

                                children: [
                                  Align(
                                    alignment: Alignment(-1,-1),
                                    child: Icon(

                                      Icons.logout,
                                      color: context.theme.textTheme.caption!.color,
                                      size: 45,
                                    ),
                                  ),
                                  //SizedBox(width: 15,),
                                  Align(
                                    alignment: Alignment(-0.5,-0.85),
                                    child: GestureDetector(
                                      onTap: (){
                                        ShowAlert(context);
                                      },
                                      child: Text(
                                        'Log out'.tr,
                                        style: TextStyle(fontFamily: 'HacenN',
                                          color: context.theme.textTheme.caption!.color,
                                          fontSize: 25,
                                        ),

                                      ),
                                    ),
                                  ),
                                  //SizedBox(width: width*0.4,),


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
