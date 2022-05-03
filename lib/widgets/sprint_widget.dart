import 'package:flutter/material.dart';

import '../constants.dart';
import 'colored_box.dart';

class SprintWidget extends StatelessWidget {
  SprintWidget({required this.sprintName, required this.coloredBoxes,  required this.addButton});

  List<ColorBox> coloredBoxes;
  String sprintName;
  bool addButton=true;
  EdgeInsets edges=EdgeInsets.fromLTRB(width * 0.03, 10, width * 0.03, 10);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.fromLTRB(width * 0.03, 35, width * 0.03, 35),
      width: width * 0.65,
      decoration: BoxDecoration(
          /*border: Border.all(color: darkSecondaryColor,width: 3),*/
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 20,
              offset: const Offset(0, 5), //changes position of shadow
            )
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: edges,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sprintName,
                  style: const TextStyle(
                    fontSize: 20,
                    color: kWritings,
                  ),
                ),
                addButton
                    ? InkWell(
                        child: const Icon(
                          Icons.add,
                          size: 40,
                          color: kMainPink,
                        ),
                        onTap: () {
                          print("tapped");
                        },
                      )
                    : Container()
              ],
            ),
          ),
          ConstrainedBox(
            constraints:  BoxConstraints( maxHeight: height*0.7,),
            child: SingleChildScrollView(
              child: Container(
                margin: edges,
                child: Column(
                  children: coloredBoxes,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
