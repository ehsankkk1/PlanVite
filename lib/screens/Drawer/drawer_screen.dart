import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:plane_vite/widgets/drawer_item.dart';
import '../../constants.dart';
import 'drawer_controller.dart';


class DrawerScreen extends GetView<MyDrawerController> {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:const [
                       CircleAvatar(radius:35,backgroundColor: kWritings,child: Text('E',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
                       SizedBox(height: 25,),
                       Text(
                        'Ehsan Abourshaed',
                        style: TextStyle(
                          fontSize: 18,
                          color: kWritings,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                        SizedBox(height: 10,),
                       Text(
                        '+963945057206',
                        style: TextStyle(
                          fontSize: 16,
                          color: kWritings,
                        ),
                      ),],
                  ),
                ),

                DrawerItem(Icons.home,35, 'Home'.tr, (){}),
                DrawerItem(Icons.task,35, 'Todo Tasks'.tr, (){
                  Get.toNamed('/todo');

                }),
                const Divider(thickness:1,color: kMainPink,),
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
                    3, (index) => DrawerItem(FontAwesomeIcons.userGroup,25, 'Sample Project'.tr, (){print(index);}),),
                ),
                DrawerItem(Icons.add,35, 'Add Project'.tr, (){}),
                const Divider(thickness:1,color: kMainPink,),
                DrawerItem(Icons.notifications,35, 'Notifications'.tr, (){
                  Get.toNamed('/notifications');

                }),
                DrawerItem(Icons.settings,35, 'Settings'.tr, (){}),
            ],
    ),
          ),
        ),
      ),
    );
  }
}