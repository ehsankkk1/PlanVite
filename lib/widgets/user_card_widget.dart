import 'package:flutter/material.dart';

import '../config/SizeConfig.dart';
import '../constants.dart';




class UserCardWidget extends StatelessWidget {
   UserCardWidget(this.username);

  String username;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: const BoxDecoration(
          /*border: Border.all(color: darkSecondaryColor,width: 3),*/
            color: kColoredCard,
            borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        child: Padding(
          padding:  EdgeInsets.fromLTRB( width * 0.03,height * 0.02,width * 0.03,height * 0.02),
          child: Row(
            children:  [
               CircleAvatar(radius:25,backgroundColor: kWritings.value,child: Text('E',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),),
              SizedBox(width: width * 0.05,),
              Flexible(
                child: Text(
                  username,
                  style:  TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal*4.7,
                    color: kWritings.value,
                  ),),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
