import 'package:flutter/material.dart';

import '../constants.dart';

class PriorityWidget extends StatelessWidget {
  PriorityWidget({required this.name, required this.colour, required this.textColor});

  Color colour;
  String name;
  Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        /*border: Border.all(color: darkSecondaryColor,width: 3),*/
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 4), //changes position of shadow
            )
          ],
          color: colour,
          borderRadius: const BorderRadius.all(Radius.circular(50))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15,5,15,5),
        child: Text(
          name,
          style:  TextStyle(
            fontSize: 15,
            color: textColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
