import 'package:flutter/material.dart';
import 'package:plane_vite/widgets/priorty_widget.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
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
            color: kColoredCard,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
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
                  style: const TextStyle(
                    fontSize: 18,
                    color: kWritings,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              priority != null
                  ? Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: PriorityWidget(priority!,kPriortyColor,kWritings),
              ):Container(),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 15,
                    backgroundColor: kWritings,
                    child: Text(
                      'E',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  dueDate != null
                      ? Text(
                        dueDate!,
                        style: const TextStyle(
                          fontSize: 15,
                          color: kWritings,
                        ),
                      ) : Container(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}