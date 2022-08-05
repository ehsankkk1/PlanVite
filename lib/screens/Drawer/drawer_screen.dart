import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:plane_vite/config/project_info.dart';
import 'package:plane_vite/widgets/drawer_item.dart';
import '../../skeleton/skeleton_controller.dart';
import 'drawer_controller.dart';


class DrawerScreen extends GetView<MyDrawerController> {

  DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SkeletonController _skeletonController = Get.find();
    MyDrawerController _myDrawerController = Get.find();
    return Obx(() {
      return Scaffold(
        backgroundColor: context.theme.hintColor,
        body: _myDrawerController.isLoading.value
            ? Container(
          //width: width*0.5,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(radius: 35,
                          backgroundColor: context.theme.textTheme.caption!
                              .color,
                          child: const Text('E', style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),),),
                        const SizedBox(height: 25,),
                        Text(
                          'Ehsan Abourshaed',
                          style: TextStyle(
                            fontSize: 18,
                            color: context.theme.textTheme.caption!.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          '+963945057206',
                          style: TextStyle(
                            fontSize: 16,
                            color: context.theme.textTheme.caption!.color,
                          ),
                        ),
                      ],
                    ),
                  ),

                  DrawerItem(Icons.home, 35, 'Home'.tr, () {
                    _skeletonController.changeScreen(0);
                  }),
                  DrawerItem(Icons.task, 35, 'Todo Tasks'.tr, () {
                    Get.toNamed('/todo');
                  }),
                  Divider(thickness: 1, color: context.theme.primaryColor,),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'WorkSpaces'.tr,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: List.generate(
                      _myDrawerController.allProjects.length,
                          (index) =>
                          DrawerItem(
                              FontAwesomeIcons.userGroup,
                              25,
                              _myDrawerController.allProjects[index].name!,
                                  () {
                                _skeletonController.changeScreen(1);
                                ProjectInformation.project_id=_myDrawerController.allProjects[index].id.toString();
                                //Get.offNamed('/sprint');
                              }),),
                  ),
                  DrawerItem(Icons.add, 35, 'Add Project'.tr, () {
                    Get.toNamed('/backlog');
                  }),
                  Divider(thickness: 1, color: context.theme.primaryColor,),
                  DrawerItem(Icons.notifications, 35, 'Notifications'.tr, () {
                    Get.toNamed('/notifications');
                  }),
                  DrawerItem(Icons.settings, 35, 'Settings'.tr, () {
                    Get.toNamed('/settings');
                  }),
                ],
              ),
            ),
          ),
        )
            : Container(
          child:Center(
            child: CircularProgressIndicator(
              color: context.theme.textTheme.caption!.color,
            ),
          ),
        ),
      );
    });
  }
}