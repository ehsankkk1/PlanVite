import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/drop_down_model_all_users.dart';
import '../../models/task_model.dart';


class TaskController extends GetxController{


  var low;
  var medium;
  var high;
  var approved;
  Rxn<DateTime> addTaskEndTime = Rxn<DateTime>();
  var fileBool;

  Task? oneTask=Get.arguments;

  List<DropDownUser> allUsersDropDown = [
    DropDownUser(name: 'Ehsan',id: 1),
    DropDownUser(name: 'Johny',id: 2),
    DropDownUser(name: 'Rita',id: 3),
    DropDownUser(name: 'Ehsan1',id: 4),
    DropDownUser(name: 'Johny1',id: 5),
    DropDownUser(name: 'Rita1',id: 6),
  ];
  int? allUserDropDownValue ;
  late TextEditingController taskTitleTextFieldController;
  TextEditingController subTaskController= TextEditingController();

  @override
  void onInit() {
    low=false.obs;
    medium=false.obs;
    high=false.obs;
    approved=false.obs;
    fileBool=false.obs;
    taskTitleTextFieldController = TextEditingController(text: oneTask!.name);
    addTaskEndTime.value = oneTask!.deadline;
    super.onInit();

  }


  void PickLow(){
    low.value=!low.value;
    medium.value=false;
    high.value=false;
  }
  void PickMedium(){
    medium.value=!medium.value;
    low.value=false;
    high.value=false;
  }
  void PickHigh(){
    high.value=!high.value;
    low.value=false;
    medium.value=false;
  }
  void PickApproved(){
    approved.value=!approved.value;
  }

  void PickFile(){
    fileBool.value=true;
  }



  void setAllUserDropDownValue(int value) {
    allUserDropDownValue = value;
    update();
  }


}
