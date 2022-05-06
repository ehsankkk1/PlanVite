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

              Image(image: AssetImage('images/log_in_flower.png'),),
              Row(
                children: [

                  Text(
                    'Plan Vite',
                    style: TextStyle(
                      color: kLightPink,

                      fontSize: 35,
                    ),
                  ),


                ],
              ),
            ],
          ),
        ),
      ),


    );
  }
}
