//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:plane_vite/widgets/custom_text_field.dart';
import '../../constants.dart';
import 'package:plane_vite/config/SizeConfig.dart';
import '../../widgets/custom_check_box.dart';
import 'log_in_controller.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  LoginController controller = Get.find();

TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx((){
      return Scaffold(
        backgroundColor: kBackGround.value,
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowGlow();
            return true;
          },
          child: SingleChildScrollView(

            child: SafeArea(
              child: Container(
                height: height*0.93,
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  children: [
                    const Align(
                        alignment: Alignment(1, -1),
                        child: Image(
                          image: AssetImage('images/log_in_flower.png'),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: height*0.2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // welcome back column
                          Column(
                            children: [
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: Text(
                                  'Welcome Back'.tr,
                                  style:  TextStyle(
                                    fontSize: 10*SizeConfig.blockSizeHorizontal,
                                    color: kWritings.value,
                                  ),
                                ),
                              ),
                              Text(
                                'please sign in to your account'.tr,
                                style: TextStyle(
                                  fontSize: 5*SizeConfig.blockSizeHorizontal,
                                  color: kWritings.value,
                                ),
                              ),
                            ],
                          ),
                          Form(
                            key: _globalKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.fromLTRB(width*0.1 ,0 , width*0.1 , 0),
                                  child: Column(children: [
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: CustomTextField(
                                        passwordBool: false,
                                        validator: (value){
                                          if(value.isEmpty){
                                            return 'Email Is Empty ! '.tr;
                                          }
                                        },
                                        controller2: emailController,
                                        hintText: 'Email',
                                        icon: Icons.email,
                                        textInputType: TextInputType.emailAddress,
                                      ),
                                    ),
                                    const SizedBox(height: 20,),
                                    Directionality(
                                        textDirection: TextDirection.ltr,
                                        child:Obx((){
                                          return CustomTextField(
                                            passwordBool: controller.passwordBool.value,
                                            secureText: controller.securePassword,
                                            validator: (value){
                                              if(value.isEmpty){
                                                return 'Password is Empty ! ';
                                              }
                                              else if (value.length<8){
                                                return 'Please Enter at least 8 Characters !'.tr;
                                              }
                                            },
                                            controller2: passwordController,
                                            hintText: 'Password',
                                            icon2: controller.passwordBool.value==true ? Icons.visibility_off:Icons.visibility,
                                            icon: Icons.lock,
                                          );
                                        })

                                    ),
                                  ],),
                                ),
                                SizedBox(height: height*0.05,),
                                GestureDetector(
                                  onTap: (){

                                  },
                                  child: Container(
                                    width: controller.selectedLangBool.value
                                        ? width * 0.3
                                        : width * 0.33,
                                    decoration: BoxDecoration(
                                      color: kMainPink.value,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: TextButton(
                                        onPressed: () {
                                          if (_globalKey.currentState!.validate()){
                                            controller.email=emailController.text;
                                            controller.password=passwordController.text;

                                             onClickLogin();


                                          }
                                        },
                                        child: Text(
                                          'Login'.tr,
                                          style:  TextStyle(
                                            color: Colors.white,
                                            fontSize: 5*SizeConfig.blockSizeHorizontal,
                                          ),
                                        )),
                                  ),
                                ),
                                SizedBox(height: height*0.05,),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: controller.selectedLangBool.value
                                          ? width * 0.29
                                          : width * 0.02,
                                      right: controller.selectedLangBool.value
                                          ? width * 0.01
                                          : width * 0.35,
                                      top: height * 0.003,
                                      bottom: height*0.02),
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    //crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Keep me sign in'.tr,
                                        style: TextStyle(
                                          fontSize: 4.5*SizeConfig.blockSizeHorizontal,
                                          color: kWritings.value,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Obx((){
                                        return  CustomCheckbox(
                                          onTap: () {
                                            controller.changeCheckBoxStatus();
                                          },
                                          color: kWritings.value,
                                          size: 25,
                                          iconSize: 20,
                                          isSelected: controller.checkBoxStatus.value,
                                        );
                                      },),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Don\'t have an account?'.tr,
                                  style:  TextStyle(
                                    color: kGrey,
                                    fontSize: 4.5*SizeConfig.blockSizeHorizontal,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/signup');
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: controller.selectedLangBool.value
                                            ? width * 0.42
                                            : width * 0.01,
                                        right: controller.selectedLangBool.value
                                            ? width * 0.01
                                            : width * 0.38,
                                        top: height * 0.003,
                                        bottom: 0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Sign up'.tr,
                                          style:  TextStyle(
                                            color: kMainPink.value,
                                            fontSize: 4.5*SizeConfig.blockSizeHorizontal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: height*0.03,),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        child: TextButton(
                                            onPressed: () {
                                              controller.selectedLang = 'en';
                                              controller.changeSelectedLang();

                                              Get.updateLocale(
                                                  Locale(controller.selectedLang));
                                            },
                                            child: Obx((){
                                              return Text(
                                                'English',
                                                style: TextStyle(
                                                  color: controller.selectedLangBool.value
                                                      ? kMainPink.value
                                                      : kGrey,
                                                  fontSize:  4.5*SizeConfig.blockSizeHorizontal,
                                                ),
                                              );
                                            })
                                        ),
                                      ),
                                      GestureDetector(
                                        child: TextButton(
                                            onPressed: () {
                                              controller.selectedLang = 'ar';
                                              controller.changeSelectedLang();

                                              Get.updateLocale(
                                                  Locale(controller.selectedLang));
                                            },
                                            child: Obx((){
                                              return  Text(
                                                'العربية',
                                                style: TextStyle(
                                                  color: controller.selectedLangBool.value
                                                      ? kGrey
                                                      : kMainPink.value,
                                                  fontSize:  4.5*SizeConfig.blockSizeHorizontal,
                                                ),
                                              );
                                            })
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
  void onClickLogin() async {
    EasyLoading.show(
      status: 'Loading...',
    );

    await controller.loginOnClick();
    if (controller.loginStatus) {
      Get.offNamed('/login');
      EasyLoading.showSuccess(controller.message);
      Get.offAllNamed('/skeleton');
    } else {
      EasyLoading.showError(
        controller.message,
        duration: Duration(seconds: 10),
        dismissOnTap: true,
      );

      print('error here');
    }
  }
}
