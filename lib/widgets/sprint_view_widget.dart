import 'package:flutter/material.dart';
import '../constants.dart';

class SprintWidget extends StatelessWidget {
  SprintWidget({required this.sprintName, required this.coloredBoxes,  required this.addButton});

  List<Widget> coloredBoxes;
  String sprintName;
  bool addButton=true;
  EdgeInsets edges=EdgeInsets.fromLTRB(width * 0.03, 10, width * 0.03, 10);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.fromLTRB(5, 10, 5, 10),
      width: width * 0.80,
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
            margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Column(
              children: [
                Row(
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
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value){},activeColor: kMainPink,),
                    const Text(
                      'Activate',
                      style:  TextStyle(
                        fontSize: 15,
                        color: kWritings,
                      ),)
                  ],
                ),
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
