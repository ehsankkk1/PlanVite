import 'package:flutter/material.dart';
import 'package:plane_vite/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: kMainPink,

          ),
          child:Column(
            children: [
SizedBox(height: height*0.1,),
              Image(image: AssetImage('images/logo-02.png'),),
              SizedBox(height: height*0.1,),
              Center(
                child: Text(
                  'Plan Vite',
                  style: TextStyle(
                    fontFamily: 'OleoScriptSwashCaps',
                    color: kWritings,

                    fontSize: 30,
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
