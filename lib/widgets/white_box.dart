import 'package:flutter/material.dart';

class WhiteBox extends StatelessWidget {


  WhiteBox({required this.height,required this.width,this.child});

  double height;
  double width;
  Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ,
      decoration: BoxDecoration(
        /*border: Border.all(color: darkSecondaryColor,width: 3),*/
          boxShadow:[BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0,4),  //changes position of shadow
          )],
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child: child,
    );
  }
}
