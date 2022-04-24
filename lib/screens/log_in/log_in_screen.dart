import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/widgets/custom_text_field.dart';
import '../../constants.dart';
import 'log_in_controller.dart';

class LoginScreen extends StatelessWidget {
  //final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kBackGround,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const Align(
                  alignment: Alignment(1, 0),
                  child: Image(
                    image: AssetImage('images/log_in_flower.png'),
                  )),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.19,
                        right: controller.selectedLangBool.value
                            ? width * 0.19
                            : width * 0.34,
                        top: height * 0.09,
                        bottom: controller.selectedLangBool.value
                            ? width * 0.02
                            : 0,),
                    child: Row(
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.14,
                        right: controller.selectedLangBool.value
                            ? width * 0.14
                            : width * 0.22,
                        top: 0,
                        bottom: 0),
                    child: Row(
                      children: [
                        Text(
                          'please sign in to your account'.tr,
                          style: const TextStyle(
                            fontSize: 20,
                            color: kWritings,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: width * 0.1,
                    right: width * 0.1,
                    top: height * 0.1,
                    bottom: 0),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: CustomTextField(
                    fontSize: 15,
                    hintText: 'Email',
                    icon: Icons.email,
                    textInputType: TextInputType.emailAddress,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: width * 0.1,
                    right: width * 0.1,
                    top: height * 0.03,
                    bottom: 0),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: CustomTextField(
                    hintText: 'Password',
                    icon: Icons.lock,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: width * 0.3,
                    right: width * 0.3,
                    top: height * 0.04,
                    bottom: 0),
                child: Container(
                  width: controller.selectedLangBool.value
                      ? width * 0.3
                      : width * 0.33,
                  decoration: BoxDecoration(
                    color: kTextFieldBorder,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextButton(
                      onPressed: () {
                        final locale = Get.locale;
                        print(locale);
                      },
                      child: Text(
                        'Login'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.25,
                        right: controller.selectedLangBool.value
                            ? width * 0.25
                            : width * 0.35,
                        top: height * 0.02,
                        bottom: 0),
                    child: Row(
                      children: [
                        Text(
                          'Don\'t have an account?'.tr,
                          style: const TextStyle(
                            color: kGrey,
                            fontSize: 18,
                          ),
                        ),
                      ],
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
                              color: kTextFieldBorder,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.33,
                        right: width * 0.02,
                        top: height * 0.04,
                        bottom: height*0.1),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
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
                                          ? kTextFieldBorder
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
                                          : kTextFieldBorder,
                                      fontSize: 18,
                                    ),
                                  );
                                })




                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
