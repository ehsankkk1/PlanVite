import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/SizeConfig.dart';
import '../constants.dart';

class SprintWidget extends StatelessWidget {
  SprintWidget({required this.sprintName,this.onTap, required this.coloredBoxes,  this.addButton,this.checkBox});

  List<Widget> coloredBoxes;
  String sprintName;
  bool? addButton=false;
  Function()? onTap;
  bool? checkBox=false;
  EdgeInsets edges=EdgeInsets.fromLTRB(width * 0.03, 10, width * 0.03, 0);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Container(
          margin:  const EdgeInsets.fromLTRB(8,8,8,0),
          child: Material(
            //color: context.theme.hintColor,

            elevation: 6,
            borderRadius:  const BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: width * 0.77,
              decoration:  BoxDecoration(
                /*border: Border.all(color: darkSecondaryColor,width: 3),*/
                  color: context.theme.hintColor,
                  borderRadius:  const BorderRadius.all(Radius.circular(10)),),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text(
                                "$sprintName",
                                style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal*5.5,
                                  color: context.theme.textTheme.caption!.color,
                                ),
                              ),
                              addButton==true?InkWell(
                                child:  Icon(
                                  Icons.add,
                                  size: 40,
                                  color: context.theme.primaryColor,
                                ),
                                onTap: onTap,
                              ):Container(width: 15,height: 15,)

                            ],
                          ),
                        ),
                        checkBox==true ?Row(
                          children: [
                            Checkbox(value: true, onChanged: (value){},activeColor: context.theme.primaryColor,),
                             Text(
                              'Activate',
                              style:  TextStyle(
                                fontSize: 15,
                                color: context.theme.textTheme.caption!.color,
                              ),)
                          ],
                        ):Container(width: 15,height: 15,),
                      ],
                    ),
                  ),
                  ConstrainedBox(
                    constraints:  BoxConstraints( maxHeight: height*0.70,),
                    child: Padding(
                      padding:  EdgeInsets.only(bottom: height * 0.01),
                      child: SingleChildScrollView(
                        child: Container(
                          child: Column(
                            children: coloredBoxes,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              ),
          ),
        ),
      ],
    );
  }
}
