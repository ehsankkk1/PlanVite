import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:plane_vite/constants.dart';
import '../Drawer/drawer_controller.dart';
import '../Drawer/drawer_screen.dart';


class HomeScreen extends StatelessWidget {
  @override
  MyDrawerController controller = Get.find();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGround,
      body: GetBuilder<MyDrawerController>(
        builder: (_) => ZoomDrawer(
          moveMenuScreen: true,
          controller: _.zoomDrawerController,
          menuScreen: DrawerScreen(),
          mainScreen: _MainScreen(),
          borderRadius: 10.0,
          showShadow: true,
          angle: 0,
          slideWidth: MediaQuery.of(context).size.width * 0.75,
        ),
      ),
    );
  }
}

class _MainScreen extends StatelessWidget {
  MyDrawerController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Center(
        child: ElevatedButton(
          onPressed: controller.toggleDrawer,
          child: Text("Toggle Drawer"),
        ),
      ),
    );
  }
}

