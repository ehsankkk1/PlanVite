import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:plane_vite/widgets/custom_text_field.dart';
import '../../constants.dart';
import 'package:plane_vite/config/SizeConfig.dart';
import '../../widgets/custom_check_box.dart';
import 'log_in_controller.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final LoginController _logInController = Get.find();

TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

      return SafeArea(
        child: Scaffold(
          backgroundColor:context.theme.backgroundColor,
          body: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.topCenter,
              fit: StackFit.loose,
              children: [
                const Align(
                    alignment: Alignment(1, -1),
                    child: Image(
                      image: AssetImage('images/log_in_flower.png'),
                    )),
                Padding(
                  padding:  EdgeInsets.only(top:height*0.2),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                                color: context.theme.textTheme.caption!.color,
                              ),
                            ),
                          ),
                          Text(
                            'please sign in to your account'.tr,
                            style: TextStyle(
                              fontSize: 5*SizeConfig.blockSizeHorizontal,
                              color:context.theme.textTheme.caption!.color,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height*0.1,),
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
                                        passwordBool: _logInController.passwordBool.value,
                                        secureText: _logInController.securePassword,
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
                                        icon2: _logInController.passwordBool.value==true ? Icons.visibility_off:Icons.visibility,
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
                                width: _logInController.selectedLangBool.value
                                    ? width * 0.3
                                    : width * 0.33,
                                decoration: BoxDecoration(
                                  color: context.theme.primaryColor,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      if (_globalKey.currentState!.validate()){
                                        _logInController.email=emailController.text;
                                        _logInController.password=passwordController.text;

                                         _logInController.onButtonLogin(context.theme.backgroundColor);
                                      }
                                    },
                                    child: Text(
                                      'Login'.tr,
                                      style:  TextStyle(
                                        color: Colors.white,
                                        fontSize: 4*SizeConfig.blockSizeHorizontal,
                                      ),
                                    )),
                              ),
                            ),
                            SizedBox(height: height*0.05,),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: _logInController.selectedLangBool.value
                                      ? width * 0.29
                                      : width * 0.02,
                                  right: _logInController.selectedLangBool.value
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
                                      color: context.theme.textTheme.caption!.color,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Obx((){
                                    return  CustomCheckbox(
                                      onTap: () {
                                        _logInController.changeCheckBoxStatus();
                                      },
                                      color: context.theme.textTheme.caption!.color!,
                                      size: 25,
                                      iconSize: 20,
                                      isSelected: _logInController.checkBoxStatus.value,
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
                                    left: _logInController.selectedLangBool.value
                                        ? width * 0.42
                                        : width * 0.01,
                                    right: _logInController.selectedLangBool.value
                                        ? width * 0.01
                                        : width * 0.38,
                                    top: height * 0.003,
                                    bottom: 0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Sign up'.tr,
                                      style:  TextStyle(
                                        color: context.theme.primaryColor,
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
                                          _logInController.selectedLang = 'en';
                                          _logInController.changeSelectedLang();

                                          Get.updateLocale(
                                              Locale(_logInController.selectedLang));
                                        },
                                        child: Obx((){
                                          return Text(
                                            'English',
                                            style: TextStyle(
                                              color: _logInController.selectedLangBool.value
                                                  ? context.theme.primaryColor
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
                                          _logInController.selectedLang = 'ar';
                                          _logInController.changeSelectedLang();

                                          Get.updateLocale(Locale(_logInController.selectedLang));
                                        },
                                        child: Obx((){
                                          return  Text(
                                            'العربية',
                                            style: TextStyle(
                                              color: _logInController.selectedLangBool.value
                                                  ? kGrey
                                                  :context.theme.primaryColor,
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
      );

  }

}
