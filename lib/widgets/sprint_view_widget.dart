import 'package:flutter/material.dart';
import '../constants.dart';

class SprintWidget extends StatelessWidget {
  SprintWidget({required this.sprintName, required this.coloredBoxes,  this.addButton,this.checkBox});

  List<Widget> coloredBoxes;
  String sprintName;
  bool? addButton=false;
  bool? checkBox=false;
  EdgeInsets edges=EdgeInsets.fromLTRB(width * 0.03, 10, width * 0.03, 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.fromLTRB(5, 10, 5, 10),
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
            margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      "Pending",
                      style: TextStyle(
                        fontSize: 20,
                        color: kWritings.value,
                      ),
                    ),
                    addButton==true?InkWell(
                      child:  Icon(
                        Icons.add,
                        size: 40,
                        color: kMainPink.value,
                      ),
                      onTap: () {
                        print("tapped");
                      },
                    ):Container(width: 15,height: 15,)

                  ],
                ),
                checkBox==true ?Row(
                  children: [
                    Checkbox(value: true, onChanged: (value){},activeColor: kMainPink.value,),
                     Text(
                      'Activate',
                      style:  TextStyle(
                        fontSize: 15,
                        color: kWritings.value,
                      ),)
                  ],
                ):Container(width: 15,height: 15,),
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
