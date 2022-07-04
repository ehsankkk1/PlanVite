import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:plane_vite/widgets/white_box.dart';

import '../config/SizeConfig.dart';
import '../constants.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 20, top: 35),
      child: Container(
        width: width * 0.6,
        height: height * 0.30,
        child: WhiteBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: EdgeInsets.fromLTRB(width * 0.07, 0, width * 0.07, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'Sample Projects'.tr,
                  style: TextStyle(
                      fontSize: 5*SizeConfig.blockSizeHorizontal,
                      color: kWritings,
                      fontWeight: FontWeight.bold),
                ),
                 Text(
                  'header'.tr,
                  style: TextStyle(
                    fontSize:4.2*SizeConfig.blockSizeHorizontal,
                    color: kWritings,
                  ),
                ),
                LinearPercentIndicator(
                  percent: 0.6,
                  animation: true,
                  backgroundColor: kLightPink,
                  progressColor: kMainPink,
                  lineHeight: height * 0.015,
                ),
                 Text(
                  'header'.tr,
                  style: TextStyle(
                    fontSize:4.2*SizeConfig.blockSizeHorizontal,
                    color: kWritings,
                  ),
                ),
                LinearPercentIndicator(
                  percent: 0.4,
                  animation: true,
                  backgroundColor: kLightPink,
                  progressColor: kMainPink,
                  lineHeight: height * 0.015,
                ),
                 Text(
                  'header'.tr,
                  style: TextStyle(
                    fontSize:4.2*SizeConfig.blockSizeHorizontal,
                    color: kWritings,
                  ),
                ),
                LinearPercentIndicator(
                  percent: 0.9,
                  animation: true,
                  backgroundColor: kLightPink,
                  progressColor: kMainPink,
                  lineHeight: height * 0.015,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
