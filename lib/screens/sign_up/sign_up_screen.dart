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
      body: ListView(
        children: [
          const Align(
              alignment: Alignment.topLeft,
              child: Image(
                image: AssetImage('images/sign_up_first_flower.png'),
              )),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: locale == 'en' ? width * 0.09 : width * 0.1,
                    right: locale == 'en' ? width * 0.01 : width * 0.16,
                    top: height * 0.04,
                    bottom:  locale == 'en' ? width * 0.02 : width * 0.01,

                ),
                child: Row(
                  children: [
                    Text(
                      'Create New Account'.tr,
                      style: TextStyle(
                        fontSize: 35,
                        color: kWritings,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: locale == 'en' ? width * 0.13 : width * 0.1,
                    right:  locale == 'en' ? width * 0.01 : width * 0.18,
                    top: 0,
                    bottom: 0),
                child: Row(
                  children: [
                    Text(
                      'please fill in the form to continue'.tr,
                      style: TextStyle(
                        fontSize: 20,
                        color: kWritings,
                      ),
                    ),
                  ],
                ),
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  children: [
                    Image(
                        image: AssetImage('images/sign_up_second_flower.png')),
                    Padding(
                      padding: EdgeInsets.only(
                          left:   width * 0.14 ,
                          right:   width * 0.01 ,
                          top: height * 0.03,
                          bottom: 0),
                      child: Container(
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
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.1,
                right: width * 0.1,
                top: height * 0.06,
                bottom: 0),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: CustomTextField(
                hintText: 'Name',
                icon: Icons.person,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.1,
                right: width * 0.1,
                top: height * 0.03,
                bottom: 0),
            child: CustomTextField(
              hintText: 'Email',
              icon: Icons.email,
              textInputType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.1,
                right: width * 0.1,
                top: height * 0.03,
                bottom: 0),
            child: CustomTextField(
              hintText: 'Password',
              icon: Icons.lock,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.1,
                right: width * 0.1,
                top: height * 0.03,
                bottom: 0),
            child: CustomTextField(
              hintText: 'Confirm Password',
              icon: Icons.lock,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.34,
                right: width * 0.34,
                top: height * 0.04,
                bottom: 0),
            child: Container(
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
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: locale =='en' ? width * 0.25: width*0.1,
                    right: locale =='en' ? width * 0.01: width*0.32,
                    top: height * 0.02,
                    bottom: 0),
                child: Row(
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
              ),
              GestureDetector(
                onTap: () {
                  Get.offNamed('/login');
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      left: locale=='en'?width * 0.42:width*0.1,
                      right: locale=='en'?width * 0.01:width*0.35,
                      top: height * 0.003,
                      bottom: height*0.1,),
                  child: Row(
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
          )
        ],
      ),
    );
  }
}
