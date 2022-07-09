import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/constants.dart';
import 'package:plane_vite/screens/notifications/notifications_controller.dart';

import '../../widgets/app_bar_no_drawer.dart';


class NotificationsScreen extends StatelessWidget {
  NotificationsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final String locale = Get.locale.toString();

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Obx((){
        return Scaffold(
            backgroundColor: kBackGround.value,
            body: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        width * 0.03, height * 0.025, width * 0.03, height * 0.025),
                    child: AppBarWidgetNoDrawer(
                      head: "Notifications",
                      save: false,
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                        itemCount: 30,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 4,
                        ),
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(
                              left: width * 0.05,
                              right: width * 0.05,
                              bottom: height * 0.001,
                              top: height * 0.001),
                          child: Container(
                            color: kBackGround.value,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                     CircleAvatar(
                                      radius: 37,
                                      backgroundColor: kMainPink.value,
                                      child: const CircleAvatar(
                                        radius: 35,
                                        backgroundColor: Colors.black12,
                                        foregroundImage: AssetImage('images/joey.png'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                     Flexible(
                                      child: Text(
                                        'Ehsan abourashed mentioned you in a comment',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: kWritings.value,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Divider(
                                  height: height * 0.02,
                                  endIndent: 1,
                                  thickness: 1.5,
                                  color: kMainPink.value,
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ));
      })
    );
  }
}
