import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../screens/Drawer/drawer_controller.dart';
import '../skeleton/skeleton_controller.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({
    Key? key,
    this.controller,
    this.head,
    this.backLog,
  }) : super(key: key);

  final MyDrawerController? controller;
  String? head;
  bool? backLog = false;
  @override
  Widget build(BuildContext context) {
    SkeletonController _skeletonController=Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        controller != null?InkWell(
          child:  Icon(
            Icons.menu_rounded,
            color: context.theme.primaryColor,
            size: 40,
          ),
          onTap: controller?.toggleDrawer,
        ):Container(),
        Text(
          "$head",
          style:  TextStyle(
            fontSize: 18,
            color: context.textTheme.caption!.color,
            fontWeight: FontWeight.bold,
          ),
        ),
        backLog == true
            ? InkWell(
                child:  Icon(
                  Icons.airplay,
                  color: context.theme.primaryColor,
                  size: 30,
                ),
                onTap: () {
                  Get.toNamed('/backlog');
                },
              )
            : InkWell(
                child:  Icon(
                  Icons.notifications,
                  color: context.theme.primaryColor,
                  size: 40,
                ),
                onTap: () {
                  Get.toNamed('/notifications');
                },
              ),
      ],
    );
  }
}
