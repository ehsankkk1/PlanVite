import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import '../Drawer/drawer_controller.dart';
import '../Drawer/drawer_screen.dart';



class HomeScreen extends GetView<MyDrawerController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDrawerController>(
      builder: (_) => ZoomDrawer(

        style: DrawerStyle.defaultStyle,
        controller: _.zoomDrawerController,
        menuScreen: DrawerScreen(),
        mainScreen: MainScreen(),
        borderRadius: 24.0,
        showShadow: true,
        angle: 0.0,
        drawerShadowsBackgroundColor: Colors.grey,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
      ),
    );
  }
}



class MainScreen extends GetView<MyDrawerController> {
  const MainScreen({Key? key}) : super(key: key);

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