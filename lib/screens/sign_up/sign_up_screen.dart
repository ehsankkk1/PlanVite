import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../widgets/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String locale = Get.locale.toString();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                      alignment: Alignment.topLeft,
                      child: Image(
                        image: AssetImage('images/sign_up_first_flower.png'),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: height*0.13),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

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
                                  Image(
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
                              Column(
                                children: [
                                  SizedBox(height: 20,),
                                  Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: CustomTextField(
                                      hintText: 'Name',
                                      icon: Icons.person,
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  CustomTextField(
                                    hintText: 'Email',
                                    icon: Icons.email,
                                    textInputType: TextInputType.emailAddress,
                                  ),
                                  SizedBox(height: 20,),
                                  CustomTextField(
                                    hintText: 'Password',
                                    icon: Icons.lock,
                                  ),
                                  SizedBox(height: 20,),
                                  CustomTextField(
                                    hintText: 'Confirm Password',
                                    icon: Icons.lock,
                                  ),
                                  SizedBox(height: 20,),

                                ],
                              ),
                            )
                          ],
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: kMainPink,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: TextButton(
                              onPressed: () {},
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
            ),
          ),
        ),
      ),
    );
  }
}
