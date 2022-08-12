import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';




class UserCardWidget extends StatelessWidget {
   UserCardWidget(this.image,this.name,this.username,this.showImage,this.onDelete);
  String? image;
  String? name;
  String username;
  bool showImage;
  Function()? onDelete;
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [

              Flexible(
                child: Row(
                  children: [
                    showImage
                        ?CircleAvatar(radius:25,backgroundColor: context.theme.textTheme.caption!.color,child:image==null? Text( name![0],style: TextStyle(fontFamily: 'HacenN',fontSize: 25,fontWeight: FontWeight.bold),)
                      :Image(image: NetworkImage(image!)),

                      )
                        :Container(),
                    SizedBox(width: width * 0.05,),

                    Flexible(
                      child: Text(
                        username,
                        style:  TextStyle(fontFamily: 'HacenN',
                          fontSize: 16,
                          color: context.theme.textTheme.caption!.color,
                        ),),
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: onDelete,
                child: Icon(Icons.exit_to_app,
                color: Colors.red,
                ),
              ),

            ],
          ),

        ),
      ),
    );

  }
}
