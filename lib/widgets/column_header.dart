import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/config/SizeConfig.dart';
import 'package:plane_vite/constants.dart';


class ColumnHeader extends StatelessWidget {
   ColumnHeader({ this.title});

   String? title;
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
                title!,
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal*5.5,
                color: context.theme.textTheme.caption!.color,
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
              'Only view my tasks'.tr,
              style:  TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal*4,
                color: context.theme.textTheme.caption!.color,
              ),)
          ],
        )
      ],
    );
  }
}
