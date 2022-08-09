import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';




class UserCardWidget extends StatelessWidget {
   UserCardWidget(this.username,this.showImage);

  String username;
  bool showImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: Container(
        decoration: BoxDecoration(
          /*border: Border.all(color: darkSecondaryColor,width: 3),*/
            color: context.theme.cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        child: Padding(
          padding:  EdgeInsets.fromLTRB( width * 0.03,height * 0.02,width * 0.03,height * 0.02),
          child: Row(
            children:  [
              showImage
              ?CircleAvatar(radius:25,backgroundColor: context.theme.textTheme.caption!.color,child: Text('E',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),)
              :Container(),
              SizedBox(width: width * 0.05,),
              Flexible(
                child: Text(
                  username,
                  style:  TextStyle(
                    fontSize: 16,
                    color: context.theme.textTheme.caption!.color,
                  ),),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
