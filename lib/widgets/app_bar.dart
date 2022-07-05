import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../screens/Drawer/drawer_controller.dart';
import '../skeleton/skeleton_controller.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({
    Key? key,
    required this.controller,
    this.head,
    this.backLog,
  }) : super(key: key);

  final MyDrawerController controller;
  String? head;
  bool? backLog = false;
  @override
  Widget build(BuildContext context) {
    SkeletonController _skeletonController=Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          child:  Icon(
            Icons.menu_rounded,
            color: kMainPink.value,
            size: 40,
          ),
          onTap: controller.toggleDrawer,
        ),
        Text(
          "$head",
          style:  TextStyle(
            fontSize: 18,
            color: kWritings.value,
            fontWeight: FontWeight.bold,
          ),
        ),
        backLog == true
            ? InkWell(
                child:  Icon(
                  Icons.airplay,
                  color: kMainPink.value,
                  size: 30,
                ),
                onTap: () {
                  _skeletonController.changeScreen(2);
                },
              )
            : InkWell(
                child:  Icon(
                  Icons.notifications,
                  color: kMainPink.value,
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
