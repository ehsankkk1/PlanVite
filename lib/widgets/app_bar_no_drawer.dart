import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../screens/Drawer/drawer_controller.dart';
import '../skeleton/skeleton_controller.dart';

class AppBarWidgetNoDrawer extends StatelessWidget {
  AppBarWidgetNoDrawer({
    Key? key,
    this.head,
    this.save=true,
    this.visible=true,
    this.onSaveTap,
    this.onBackTap,
  }) : super(key: key);

  String? head;
  bool save;
  Function()? onSaveTap;
  Function()? onBackTap;
  bool visible;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: onBackTap,
          child: Icon(
            Icons.arrow_back,
            color: context.theme.primaryColor,
            size: 35,
          ),
        ),
        Flexible(
          child: Text(
            "$head",
            style:  TextStyle(fontFamily: 'HacenN',
              fontSize: 18,
              color: context.theme.textTheme.caption!.color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        save?InkWell(
          onTap: onSaveTap,
          child: Visibility(
            visible: visible,
            child: Icon(
              Icons.check,
              color: context.theme.primaryColor,
              size: 35,
            ),
          ),
        ):Container(width: 25,height: 25,),
      ],
    );
  }
}
