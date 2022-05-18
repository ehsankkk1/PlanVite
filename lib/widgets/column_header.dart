import 'package:flutter/material.dart';
import 'package:plane_vite/constants.dart';


class ColumnHeader extends StatelessWidget {
  const ColumnHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
       /* Row(
          children: [
            Checkbox(value: true, onChanged: (value){},activeColor: kMainPink,),
            Text(
              'Only view my tasks',
              style:  TextStyle(
                fontSize: 15,
                color: kWritings,
              ),)
          ],
        )*/
      ],
    );
  }
}
