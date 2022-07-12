import 'package:flutter/material.dart';

import '../constants.dart';

class PriorityWidget extends StatelessWidget {
  PriorityWidget({required this.name, required this.colour, required this.textColor});

  Color colour;
  String name;
  Color textColor;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius:const BorderRadius.all(Radius.circular(50)) ,
      child: Container(
        decoration: BoxDecoration(
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
      ),
    );
  }
}
