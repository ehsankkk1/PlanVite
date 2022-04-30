import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/screens/sign_up/sign_up_controller.dart';

import '../../constants.dart';
import '../../widgets/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  SignupController controller = Get.find();

  @override
  Widget build(BuildContext context) {


    final String locale = Get.locale.toString();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kBackGround,

      body: InteractiveViewer(
        child: SafeArea(
          child: ListView(

            children: [
              Container(
              height: locale=='en'? height*1.1:height*1.15,

              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Image(
                        image: AssetImage('images/sign_up_first_flower.png'),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: height*0.12),

                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        Column(
                          children: [

                            Directionality(
                              textDirection: TextDirection.ltr,

                              child: Text(
                                'Create New Account'.tr,
                                style: TextStyle(
                                  fontSize: 35,
                                  color: kWritings,
                                ),
                              ),
                            ),
                            Text(
                              'please fill in the form to continue'.tr,
                              style: TextStyle(
                                fontSize: 20,
                                color: kWritings,
                              ),
                            ),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: Row(

                                children: [
                                  const Image(
                                      image: AssetImage('images/sign_up_second_flower.png')),
                                  SizedBox(
                                    width: width*0.12,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: kMainPink,
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    width: 150,
                                    height: 150,
                                    child: const Icon(
                                      Icons.add_a_photo,
                                      size: 70,
                                      color: kMainPink,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.fromLTRB(width*0.1 ,0 , width*0.1 , 0),
                              child:
                              Form(
                                key: _globalKey,
                                child: Column(
                                  children: [
                                    SizedBox(height: 20,),
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: CustomTextField(
                                        passwordBool: false,
                                        validator: (value){
                                          if(value.isEmpty){
                                            return 'Name is Empty ! '.tr;
                                          }
                                        },
                                        controller2: nameController,
                                        hintText: 'Name'.tr,
                                        icon: Icons.person,
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    CustomTextField(
                                      passwordBool: false,
                                      validator: (value){
                                        if(value.isEmpty){
                                          return 'Email is empty ! '.tr;
                                        }
                                      },
                                      controller2: emailController,
                                      hintText: 'Email'.tr,
                                      icon: Icons.email,
                                      textInputType: TextInputType.emailAddress,
                                    ),
                                    SizedBox(height: 20,),
                                    Obx((){
                                      return CustomTextField(
                                        passwordBool: controller.passwordBool.value,
                                        secureText: controller.securePassword,
                                        icon2: controller.passwordBool.value==true ? Icons.visibility_off:Icons.visibility,

                                        validator: (value){
                                          if(value.isEmpty){
                                            return 'Password Is Empty ! '.tr;
                                          }
                                        },
                                        controller2: passwordController,
                                        hintText: 'Password'.tr,
                                        icon: Icons.lock,
                                      );
                                    }),

                                    SizedBox(height: 20,),
                                    Obx((){
                                      return CustomTextField(
                                        passwordBool: controller.confirmPasswordBool.value,
                                        secureText: controller.secureConfirmPassword,
                                        icon2: controller.confirmPasswordBool.value==true ? Icons.visibility_off:Icons.visibility,

                                        validator: (value){
                                          if(value.isEmpty){
                                            return 'Confirm Password Is Empty ! '.tr;
                                          }
                                        },
                                        controller2: confirmPasswordController,
                                        hintText: 'Confirm Password'.tr,
                                        icon: Icons.lock,
                                      );
                                    }),

                                    SizedBox(height: 20,),

                                  ],
                                ),
                              ),
                            )
                          ],
                        ),

                        Container(
                          width: 120,
                          decoration: BoxDecoration(
                            color: kMainPink,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: TextButton(
                              onPressed: () {
                                if (_globalKey.currentState!.validate()){
                                  controller.name=nameController.text;
                                  controller.email=emailController.text;
                                  controller.password=passwordController.text;
                                  controller.confirmPassword=confirmPasswordController.text;
                                  Get.offNamed('/home');

                                }


                              },
                              child:  Text(
                                'Register'.tr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              )),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account?'.tr,
                                  style: TextStyle(
                                    color: kGrey,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.offNamed('/login');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [
                                  Text(
                                    'Sign in'.tr,
                                    style: TextStyle(
                                      color: kMainPink,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding:  EdgeInsets.only(left: width*0.33,right: width*0.02,top: height*0.04,bottom: 0),
                            //   child: Row(
                            //     children: [
                            //       TextButton(onPressed: (){}, child: Text('English',
                            //         style: TextStyle(
                            //           color: kTextFieldBorder,
                            //           fontSize: 18,
                            //         ),
                            //       )),
                            //       TextButton(onPressed: (){}, child: Text('العربية',
                            //         style: TextStyle(
                            //           color: kGrey,
                            //           fontSize: 18,
                            //         ),
                            //       ))
                            //     ],
                            //   ),
                            // ),

                          ],
                        )],
                    ),
                  )

                ],
              ),
            ),],
          )
        ),
      ),
    );
  }
}
