import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {



      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(width * 0.1,height * 0.12,width * 0.1,0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      'Task Management',
                      style: TextStyle(
                        color: context.theme.textTheme.caption!.color,
                        fontSize: 46,
                      ),
                    ),
                    const SizedBox(height: 20,),
                     Text(
                      'Manage your daily task easier like never before. Easy to use',
                      style: TextStyle(
                        color: context.theme.textTheme.caption!.color,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {
                        Get.offAllNamed('/login');
                      },
                      child: Container(
                        width: width * 0.5,
                        decoration: BoxDecoration(
                          color: context.theme.primaryColor,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: TextButton(
                            onPressed: () {
                              Get.offAllNamed('/login');
                            },
                            child: const Text(
                              'Let???s Get Started',
                              style: TextStyle(
                                color: Color(0xFFFCF8F3),
                                fontSize: 20,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              const Image(
                image: AssetImage('images/welcome_pic.png'),
              )
            ],
          ),
        ),
      );

  }
}
