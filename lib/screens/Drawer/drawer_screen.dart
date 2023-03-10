import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:plane_vite/config/project_info.dart';
import 'package:plane_vite/screens/agenda/agenda_controller.dart';
import 'package:plane_vite/screens/notifications/notifications_controller.dart';
import 'package:plane_vite/screens/sprint/sprint_controller.dart';
import 'package:plane_vite/widgets/drawer_item.dart';
import '../../constants.dart';
import '../../skeleton/skeleton_controller.dart';
import '../home/home_controller.dart';
import 'drawer_controller.dart';


class DrawerScreen extends GetView<MyDrawerController> {
  HomeController _homeController =   Get.put(HomeController());
  AgendaController _agendaController =   Get.put(AgendaController());
  NotificationsController _notificationsController =   Get.put(NotificationsController());
  DrawerScreen({Key? key}) : super(key: key);
double rating=0;
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
            child: RefreshIndicator(
              color: context.theme.primaryColor,
              backgroundColor: context.theme.backgroundColor,
              onRefresh:_myDrawerController.load ,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 37,
                            backgroundColor: context.theme.primaryColor,
                            child:  CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.black12,

                              foregroundImage: NetworkImage(_myDrawerController.userInfo?.image==null?"https://th.bing.com/th/id/OIP.QqThEN77e1aL9ps4M3mDGwAAAA?pid=ImgDet&w=220&h=220&c=7&dpr=1,88":_myDrawerController.userInfo?.image),
                            ),
                          ),
                          const SizedBox(height: 25,),
                          Text(
                            _myDrawerController.userInfo!.name,
                            style: TextStyle(fontFamily: 'HacenN',
                              fontSize: 18,
                              color: context.theme.textTheme.caption!.color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              RatingBar.builder(
                                minRating: 0.5,
                                allowHalfRating: true,
                                itemSize: 25,
                                updateOnDrag: false,
                                initialRating: _myDrawerController.userInfo!.rating!.toDouble(),
                                glow: true,
                                ignoreGestures: true,

                                itemBuilder: (context, _) =>
                                    Icon(Icons.star, color: Color(0xFFFFAAA5),),
                                onRatingUpdate: (rat) {
                                 // controller.rating.value = rating.toInt();

                                },),
                              SizedBox(width: width*0.02,),
                              Column(
                                children: [

                                  Text('rated by  '.tr+_myDrawerController.userInfo!.userRatingCount.toString()+'  users'.tr,
                                   style: TextStyle(fontFamily: 'HacenN',
                                      fontSize: 16,
                                      color: context.theme.textTheme.caption!.color,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          SizedBox(height: 10,),
                          Text(

                            _myDrawerController.userInfo?.phoneNumber==""?_myDrawerController.userInfo!.email:_myDrawerController.userInfo?.phoneNumber,
                            style: TextStyle(fontFamily: 'HacenN',
                              fontSize: 16,
                              color: context.theme.textTheme.caption!.color,
                            ),
                          ),
                        ],
                      ),
                    ),

                    DrawerItem(Icons.home, 35, 'Home'.tr, () {

                      _skeletonController.changeScreen(0);
                      _homeController.load();
                    }),
                    DrawerItem(Icons.task, 35, 'Personal Tasks'.tr, () {
                      Get.toNamed('/todo');
                    }),
                    Divider(thickness: 1, color: context.theme.primaryColor,),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'WorkSpaces'.tr,
                        style:  TextStyle(fontFamily: 'HacenN',
                          fontSize: 15,
                          color: context.theme.canvasColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Column(
                      children: List.generate(
                        _myDrawerController.allProjects!.length,
                            (index) =>
                            DrawerItem(
                                FontAwesomeIcons.userGroup,
                                25,
                                _myDrawerController.allProjects![index].name!,
                                    () {
                                  SprintController _sprintController =  Get.put(SprintController());
                                  _sprintController.onChangeIndex( _myDrawerController.allProjects![index].id!);
                                  _skeletonController.changeScreen(1);
                                  //Get.offNamed('/sprint');
                                }),),
                    ),
                    DrawerItem(Icons.add, 35, 'Add Project'.tr, () {
                      _myDrawerController.showAddProjectField(context);
                    }),
                    Divider(thickness: 1, color: context.theme.primaryColor,),
                    DrawerItem(Icons.notifications, 35, 'Notifications'.tr, () {
                      Get.toNamed('/notifications');
                      _notificationsController.load();
                    }),

                    DrawerItem(Icons.article, 35, 'Agenda'.tr, () {

                      Get.toNamed('/agenda');
                      _agendaController.load();
                    }),
                    DrawerItem(Icons.settings, 35, 'Settings'.tr, () {
                      Get.toNamed('/settings');
                    }),
                  ],
                ),
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