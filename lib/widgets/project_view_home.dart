import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:plane_vite/widgets/white_box.dart';

import '../config/SizeConfig.dart';
import '../constants.dart';

class ProjectView extends StatelessWidget {
  ProjectView({
    Key? key,
    this.head,
    this.daysGone,
    this.totalDays,
    this.completedTasks,
    this.projectToOthers,

  }) : super(key: key);

  String? head;
  int? daysGone;
  int? totalDays;
  double? completedTasks;
  double? projectToOthers;


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
                  head.toString(),
                  style: TextStyle(fontFamily: 'HacenN',
                      fontSize: 5*SizeConfig.blockSizeHorizontal,
                      color: context.theme.textTheme.caption!.color,
                      fontWeight: FontWeight.bold),
                ),
                 Text(
                  'Days Left :'.tr,
                  style: TextStyle(fontFamily: 'HacenN',
                    fontSize:4.2*SizeConfig.blockSizeHorizontal,
                    color: context.theme.textTheme.caption!.color,
                  ),
                ),
                LinearPercentIndicator(
                  percent: (totalDays!-daysGone!)/totalDays!,
                  animation: true,
                  backgroundColor: context.theme.primaryColorLight,
                  progressColor: context.theme.primaryColor,
                  lineHeight: height * 0.015,
                ),
                 Text(
                  'Completed Tasks :'.tr,
                  style: TextStyle(fontFamily: 'HacenN',
                    fontSize:4.2*SizeConfig.blockSizeHorizontal,
                    color: context.theme.textTheme.caption!.color,
                  ),
                ),
                LinearPercentIndicator(
                  percent: completedTasks!,
                  animation: true,
                  backgroundColor: context.theme.primaryColorLight,
                  progressColor: context.theme.primaryColor,
                  lineHeight: height * 0.015,
                ),
                 Text(
                  'This Project Progress to Others :'.tr,
                  style: TextStyle(fontFamily: 'HacenN',
                    fontSize:4.2*SizeConfig.blockSizeHorizontal,
                    color: context.theme.textTheme.caption!.color,
                  ),
                ),
                LinearPercentIndicator(
                  percent: projectToOthers!,
                  animation: true,
                  backgroundColor: context.theme.primaryColorLight,
                  progressColor: context.theme.primaryColor,
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
