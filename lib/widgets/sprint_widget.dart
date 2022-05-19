import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plane_vite/widgets/user_card_widget.dart';

import '../constants.dart';
import 'task_widget.dart';

class SprintWidget extends StatelessWidget {
  SprintWidget({required this.sprintName, required this.coloredBoxes,  required this.addButton});

  List<Widget> coloredBoxes;
  String sprintName;
  bool addButton=true;
  EdgeInsets edges=EdgeInsets.fromLTRB(width * 0.03, 10, width * 0.03, 10);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.fromLTRB(width * 0.03, 35, width * 0.015, 35),
      width: width * 0.85,
      decoration: BoxDecoration(
        /*border: Border.all(color: darkSecondaryColor,width: 3),*/
          boxShadow: [
            kBoxShadow
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(15) ,bottomRight: Radius.circular(15) ),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: edges,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Pending",
                  style: TextStyle(
                    fontSize: 20,
                    color: kWritings,
                  ),
                ),
                InkWell(
                  child: const Icon(
                    Icons.add,
                    size: 40,
                    color: kMainPink,
                  ),
                  onTap: () {
                    print("tapped");
                  },
                )

              ],
            ),
          ),
          ConstrainedBox(
            constraints:  BoxConstraints( maxHeight: height*0.75,),
            child: Padding(
              padding:  EdgeInsets.only(bottom: height * 0.01),
              child: SingleChildScrollView(
                child: Container(
                  margin: edges,
                  child: Column(
                    children: coloredBoxes,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
      );
  }
}
