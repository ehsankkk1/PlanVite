//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:plane_vite/widgets/custom_text_field.dart';
import '../../constants.dart';
import 'log_in_controller.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  LoginController controller = Get.find();
TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;

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
                                      validator: (value){
                                        if(value.isEmpty){
                                          return 'Email is empty ! ';
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
                                    child: CustomTextField(
                                      validator: (value){
                                        if(value.isEmpty){
                                          return 'Email is empty ! ';
                                        }
                                      },
                                      controller2: passwordController,
                                      hintText: 'Password',
                                      icon: Icons.lock,
                                    ),
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
