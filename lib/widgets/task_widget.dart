import 'package:flutter/material.dart';
import 'package:plane_vite/widgets/priorty_widget.dart';
import '../config/SizeConfig.dart';
import '../constants.dart';


class TaskWidget extends StatelessWidget {
  TaskWidget({
    required this.name,
    this.priority,
    this.dueDate,
    this.image,
    this.avatar,
  });

  String name;
  String? priority;
  String? dueDate;
  Image? image;
  Image? avatar;
  @override

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding:  EdgeInsets.symmetric(vertical :width*0.02),
      child: Material(
        elevation: 0,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          decoration: const BoxDecoration(
              color: kColoredCard,
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                width * 0.03, height * 0.02, width * 0.03, height * 0.02),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //const Image(image: NetworkImage('https://wallpaperaccess.com/full/7794852.jpg')),
                //const SizedBox(height: 15,),
                Flexible(
                  child: Text(
                    name,
                    style:  TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal*4.7,
                      color: kWritings.value,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                priority != null
                    ? Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: PriorityWidget(name:priority!,colour:kPriortyColor,textColor:kWritings.value),
                ):Container(),
                Row(
                  children: [
                     CircleAvatar(
                      radius: 15,
                      backgroundColor: kWritings.value,
                      child: Text(
                        'E',
                        style:
                            TextStyle(fontSize: SizeConfig.blockSizeHorizontal*3.5, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    dueDate != null
                        ? Text(
                          dueDate!,
                          style:  TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal*3.7,
                            color: kWritings.value,
                          ),
                        ) : Container(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
