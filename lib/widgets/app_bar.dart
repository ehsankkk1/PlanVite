import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../screens/Drawer/drawer_controller.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          child: const Icon(
            Icons.menu_rounded,
            color: kMainPink,
            size: 40,
          ),
          onTap: controller.toggleDrawer,
        ),
        Text(
          "$head",
          style: const TextStyle(
            fontSize: 18,
            color: kWritings,
            fontWeight: FontWeight.bold,
          ),
        ),
        backLog == true
            ? InkWell(
                child: const Icon(
                  Icons.airplay,
                  color: kMainPink,
                  size: 30,
                ),
                onTap: () {
                  Get.toNamed('/backlog');
                },
              )
            : InkWell(
                child: const Icon(
                  Icons.notifications,
                  color: kMainPink,
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
