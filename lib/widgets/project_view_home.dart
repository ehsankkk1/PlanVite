import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:plane_vite/widgets/white_box.dart';

import '../constants.dart';


class ProjectView extends StatelessWidget {
  const ProjectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 30,bottom: 50),
      child: Container(
        width: width*0.6,
        height: height * 0.30,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            WhiteBox(double.infinity, double.infinity),
            Padding(
              padding: EdgeInsets.fromLTRB( width * 0.07,0,width * 0.07,0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sample Projects',
                    style: TextStyle(
                      fontSize: 20,
                      color: kWritings,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const  Text(
                    'header',
                    style: TextStyle(
                      fontSize: 20,
                      color: kWritings,
                    ),
                  ),
                  LinearPercentIndicator(
                    percent: 0.6,
                    animation: true,
                    backgroundColor: kLightPink,
                    progressColor: kMainPink,
                    lineHeight: height * 0.02,
                  ),
                  const  Text(
                    'header',
                    style: TextStyle(
                      fontSize: 20,
                      color: kWritings,
                    ),
                  ),
                  LinearPercentIndicator(
                    percent: 0.4,
                    animation: true,
                    backgroundColor: kLightPink,
                    progressColor: kMainPink,
                    lineHeight: height * 0.02,
                  ),
                  const  Text(
                    'header',
                    style: TextStyle(
                      fontSize: 20,
                      color: kWritings,
                    ),
                  ),
                  LinearPercentIndicator(
                    percent: 0.9,
                    animation: true,
                    backgroundColor: kLightPink,
                    progressColor: kMainPink,
                    lineHeight: height * 0.02,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
