import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/constants.dart';
import 'package:plane_vite/screens/notifications/notifications_controller.dart';

import '../../config/SizeConfig.dart';


class NotificationsScreen extends StatelessWidget {
  NotificationsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final String locale = Get.locale.toString();

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
          backgroundColor: kBackGround,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: kMainPink),
            backgroundColor: kBackGround,
            title: Padding(
              padding: EdgeInsets.only(
                  left: locale == 'en' ? width * 0.18 : width * 0.25),
              child: Text(
                'Notifications'.tr,
                style: const TextStyle(
                  color: kWritings,
                ),
              ),
            ),
          ),
          body: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 37,
                          backgroundColor: kMainPink,
                          child: CircleAvatar(
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
                              fontSize: 4.5*SizeConfig.blockSizeHorizontal,
                              color: kWritings,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: height * 0.01,
                    endIndent: 1,
                    thickness: 1,
                    color: kMainPink,
                  )
                ],
              ))),
    );
  }
}
