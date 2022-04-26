import 'package:flutter/material.dart';

class WhiteBox extends StatelessWidget {


  WhiteBox(this.height,this.width);

  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ,
      decoration: BoxDecoration(
        /*border: Border.all(color: darkSecondaryColor,width: 3),*/
          boxShadow:[BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 2,
            blurRadius: 20,
            offset: const Offset(0,5),  //changes position of shadow
          )],
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
    );
  }
}
