import 'package:flutter/material.dart';

import '../constants.dart';

class ColorBox extends StatelessWidget {


  ColorBox(this.data);

  String data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(

        decoration: BoxDecoration(
          /*border: Border.all(color: darkSecondaryColor,width: 3),*/
            boxShadow:[BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0,5),  //changes position of shadow
            )],
            color: kColoredCard,
            borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        child: Padding(
          padding:  EdgeInsets.fromLTRB( width * 0.03,height * 0.02,width * 0.03,height * 0.02),
          child: Row(
            children:  [
              const CircleAvatar(radius:25,backgroundColor: kWritings,child: Text('E',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),),
              SizedBox(width: width * 0.05,),
               Flexible(
                child: Text(
                  data,
                  style: const TextStyle(
                    fontSize: 16,
                    color: kWritings,
                  ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
