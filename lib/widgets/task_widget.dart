import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plane_vite/widgets/priorty_widget.dart';
import '../config/SizeConfig.dart';
import '../constants.dart';


class TaskWidget extends StatelessWidget {
  TaskWidget({
    this.name,
    this.priority,
    this.dueDate,
    this.image,
    this.avatar,
    this.loading=false,
  });

  String? name;
  String? priority;
  String? dueDate;
  Image? image;
  Image? avatar;
  bool loading;
  @override

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: (){
        Get.toNamed('/view_task');
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical :width*0.02),
        child: Container(
          decoration:  BoxDecoration(
              color: context.theme.cardColor,
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
                    '$name',
                    style:  TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal*4.7,
                      color: context.theme.textTheme.caption!.color,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                priority != null ? Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: PriorityWidget(name:priority!,colour:context.theme.primaryColor,textColor:context.theme.textTheme.caption!.color!),
                ):Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                         CircleAvatar(
                          radius: 15,
                          backgroundColor:context.theme.textTheme.caption!.color,
                          child: Text(
                            'E',
                            style:
                                TextStyle(fontSize: SizeConfig.blockSizeHorizontal*3.5, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        dueDate != null ? Text(
                              dueDate!,
                              style:  TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                color: context.theme.textTheme.caption!.color,
                              ),
                            ) : Container(),
                      ],
                    ),
                    Container(
                      height: 18,
                      width: 18,
                      child:  loading?CircularProgressIndicator(
                        color: context.theme.textTheme.caption!.color,
                      ):Container(),
                    ),
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
