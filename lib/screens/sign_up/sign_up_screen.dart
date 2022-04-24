import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../widgets/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    left: width * 0.09,
                    right: width * 0.013,
                    top: height * 0.04,
                    bottom: height * 0.02),
                child: Row(
                  children: const [
                    Text(
                      'Create New Account',
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
                    left: width * 0.13, right: width * 0.01, top: 0, bottom: 0),
                child: Row(
                  children: const [
                    Text(
                      'please fill in the form to continue',
                      style: TextStyle(
                        fontSize: 20,
                        color: kWritings,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Image(image: AssetImage('images/sign_up_second_flower.png')),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.14,
                        right: width * 0.01,
                        top: height * 0.03,
                        bottom: 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: kTextFieldBorder,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      width: 150,
                      height: 150,
                      child: const Icon(
                        Icons.add_a_photo,
                        size: 70,
                        color: kTextFieldBorder,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.1,
                right: width * 0.1,
                top: height * 0.06,
                bottom: 0),
            child: CustomTextField(
              hintText: 'Name',
              icon: Icons.person,
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
                color: kTextFieldBorder,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Register',
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
                    left: width * 0.25,
                    right: width * 0.01,
                    top: height * 0.02,
                    bottom: 0),
                child: Row(
                  children: const [
                    Text(
                      'Already have an account?',
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
                      left: width * 0.42,
                      right: width * 0.01,
                      top: height * 0.003,
                      bottom: 0),
                  child: Row(
                    children: const [
                      Text(
                        'Sign in',
                        style: TextStyle(
                          color: kTextFieldBorder,
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
