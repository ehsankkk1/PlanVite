import 'package:flutter/material.dart';

import '../constants.dart';
import '../screens/Drawer/drawer_controller.dart';

class AppBarWidget extends StatelessWidget {
   AppBarWidget({
    Key? key,
    required this.controller,
    this.head,
  }) : super(key: key);

  final MyDrawerController controller;
  String? head;
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
        InkWell(
          child: const Icon(
            Icons.notifications,
            color: kMainPink,
            size: 40,
          ),
          onTap: () {},
        ),
      ],
    );
  }
}