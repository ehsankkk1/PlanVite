import 'package:flutter/material.dart';
import 'package:plane_vite/config/SizeConfig.dart';
import 'package:plane_vite/constants.dart';


class ColumnHeader extends StatelessWidget {
  const ColumnHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
              Text(
              "Pending",
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal*5.5,
                color: kWritings.value,
              ),
            ),
            Container(height: height*0.05,width: width*0.01,)
            /*InkWell(
              child: const Icon(
                Icons.add,
                size: 40,
                color: kMainPink,
              ),
              onTap: () {
                print("tapped");
              },
            )*/
          ],
        ),
        Row(
          children: [
            Checkbox(value: true, onChanged: (value){},activeColor: kMainPink.value,),
             Text(
              'Only view my tasks',
              style:  TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal*4,
                color: kWritings.value,
              ),)
          ],
        )
      ],
    );
  }
}
