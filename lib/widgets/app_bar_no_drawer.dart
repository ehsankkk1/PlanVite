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
  }) : super(key: key);

  String? head;
  bool save;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {Get.back();},
          child: Icon(
            Icons.arrow_back,
            color: kMainPink.value,
            size: 35,
          ),
        ),
        Text(
          "$head",
          style:  TextStyle(
            fontSize: 18,
            color: kWritings.value,
            fontWeight: FontWeight.bold,
          ),
        ),
        save?InkWell(
          onTap: () {Get.back();},
          child: Icon(
            Icons.check,
            color: kMainPink.value,
            size: 35,
          ),
        ):Container(),
      ],
    );
  }
}
