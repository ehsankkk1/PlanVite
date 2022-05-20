//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:plane_vite/widgets/custom_text_field.dart';
import '../../constants.dart';
import '../../widgets/custom_check_box.dart';
import 'log_in_controller.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  LoginController controller = Get.find();
TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kBackGround,
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
                                style: const TextStyle(
                                  fontSize: 35,
                                  color: kWritings,
                                ),
                              ),
                            ),
                            Text(
                              'please sign in to your account'.tr,
                              style: const TextStyle(
                                fontSize: 20,
                                color: kWritings,
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
                                      fontSize: 15,
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
                              const SizedBox(height: 30,),
                              Container(
                                width: controller.selectedLangBool.value
                                    ? width * 0.3
                                    : width * 0.33,
                                decoration: BoxDecoration(
                                  color: kMainPink,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      if (_globalKey.currentState!.validate()){
                                        controller.email=emailController.text;
                                        controller.password=passwordController.text;

                                        print(controller.email);
                                      }



                                    },
                                    child: Text(
                                      'Login'.tr,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    )),
                              ),
                              const SizedBox(height: 30,),
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
                                        fontSize: 18,
                                        color: kWritings,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Obx((){
                                      return  CustomCheckbox(
                                        onTap: () {
                                          controller.changeCheckBoxStatus();


                                        },
                                        color: kWritings,
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
                                style: const TextStyle(
                                  color: kGrey,
                                  fontSize: 18,
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
                                        style: const TextStyle(
                                          color: kMainPink,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30,),
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
                                                    ? kMainPink
                                                    : kGrey,
                                                fontSize: 18,
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
                                                    : kMainPink,
                                                fontSize: 18,
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
  }
}
