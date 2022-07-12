
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:plane_vite/test/test_controller.dart';
import 'package:holding_gesture/holding_gesture.dart';
class Test extends StatelessWidget {
  TestController controller = Get.find();
  Widget buildRating()=> RatingBar.builder(
    minRating: 1,
    itemBuilder: (context,_)=>Icon(Icons.star,color:Colors.amber), onRatingUpdate: (rating)  {

    controller.rating.value=rating.toInt();
  },

  );
  @override
  Widget build(BuildContext context) {
    void showRating(){
      showDialog(context: context, builder: (context)=>AlertDialog(

        title: Text('Rate this user'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.min ,
          children: [
            Text('please leave a star rating',),
            SizedBox(height: 30,),
            buildRating(),

          ],
        ),actions: [
          TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Ok'),)
      ],
      ),);
    }
    return Scaffold(

      body: Center(
        child:HoldDetector(
          onHold: showRating,
          holdTimeout: Duration(milliseconds: 200),
          enableHapticFeedback: true,
          child: TextButton(
            child: Text('Click Here'),
            onPressed: (){
              showRating;
            },
          ),
        )
      ),
    );


  }

}
