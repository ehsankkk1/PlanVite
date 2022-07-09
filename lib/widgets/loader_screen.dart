import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/constants.dart';


class LoaderScreen extends StatelessWidget {
   LoaderScreen({this.error=false,});

  bool error;
  @override
Widget build(BuildContext context) {
      return Container(
        height: 150,
        width: 150,
        child: Scaffold(
          backgroundColor: kBackGround.value,
          body: Center(
            child : error?Image.asset(
                "images/NO.gif"
            ):
            Image.asset(
                "images/loader.gif"
            ),
          ),
        ),
      );
  }
}
