import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'colored_box.dart';

class SprintWidget extends StatelessWidget {
  SprintWidget({required this.sprintName, required this.coloredBoxes,  required this.addButton});

  List<ColorBox> coloredBoxes;
  String sprintName;
  bool addButton=true;
  EdgeInsets edges=EdgeInsets.fromLTRB(width * 0.01, 15, width * 0.01, 15);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: edges,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
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
                  : Container(width: 40,height: 40,)
            ],
          ),
          ConstrainedBox(
            constraints:  BoxConstraints( maxHeight: height*0.77,),
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowIndicator();
                return true;
              },
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
