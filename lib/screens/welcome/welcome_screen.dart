import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kBackGround,
      body: SafeArea(

        child: Column(
         children: [
           Padding(
  padding: EdgeInsets.only(left: width*0.1,right: width*0.1,top: height*0.12,bottom: 0),
  child:   Text('Task Management',

  style: TextStyle(

    color: kWritings,

    fontSize: 46,

  ),



  ),
),
           Padding(
             padding: EdgeInsets.only(left: width*0.1,right: width*0.12,top: 0,bottom: 0),
             child:   Text('Manage your daily task easier like never before. Easy to use',

               style: TextStyle(

                 color: kWritings,

                 fontSize: 20,

               ),



             ),
           ),

           Padding(
             padding: EdgeInsets.only(left: width*0.1,right:width *0.4,top: height*0.04,bottom: 0),
             child: GestureDetector(
               onTap: (){
                 Get.toNamed('/login');
               },
               child: Container(
                 width:
                      width * 0.5,

                 decoration: BoxDecoration(
                   color: kTextFieldBorder,
                   borderRadius: BorderRadius.circular(25.0),
                 ),
                 child: TextButton(
                     onPressed: () { Get.toNamed('/login');},
                     child: Text(
                       'Let’s Get Started',
                       style: const TextStyle(
                         color: Color(0xFFFCF8F3),
                         fontSize: 20,
                       ),
                     )),
               ),
             ),
           ),

           Padding(
             padding: EdgeInsets.only(left: 0,right:0,top: height*0.11,bottom: 0),
             child: Image(image: AssetImage('images/welcome_pic.png'),),
           )

         ],
        ),
      ),
    );
  }
}
