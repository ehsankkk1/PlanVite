import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration:  BoxDecoration(
            color: context.theme.backgroundColor,
          ),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              const Image(
                image: AssetImage('images/logo-02.png'),
              ),
              SizedBox(
                height: height * 0.1,
              ),
               Center(
                child: Text(
                  'Plan Vite',
                  style: TextStyle(
                    fontFamily: 'OleoScriptSwashCaps',
                    color: context.theme.textTheme.caption!.color,
                    fontSize: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
