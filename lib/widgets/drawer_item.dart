import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';


class DrawerItem extends StatelessWidget {
   DrawerItem(
       this.icon,
       this.size,
       this.name,
       this.onPress,
       );

  IconData icon;
  double size;
  String name;
  VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15,15,0,15),
        child: Row(
          children:  [
            Icon(icon,color: kMainPink.value,size: size,),
            const SizedBox(width: 25,),
            Text(
              name,
              style:  TextStyle(
                fontSize: 15,
                color: kWritings.value,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
      onTap: onPress,
    );
  }
}
