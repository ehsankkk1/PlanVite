import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/screens/task/task_services.dart';

import '../../models/drop_down_model_all_users.dart';
import '../../models/task_model.dart';
import '../back_log/back_log_controller.dart';


class TaskController extends GetxController{


  var low;
  var medium;
  var high;
  var approved;
  Rxn<DateTime> addTaskEndTime = Rxn<DateTime>();
  var fileBool;
  TaskService _taskService = TaskService();
  final BackLogController _backLogController = Get.find();
  Task? oneTask=Get.arguments[0];
  int? taskIndex=Get.arguments[1];
  int? sprintIndex=Get.arguments[2];

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
  late TextEditingController taskDescriptionTextFieldController;
  TextEditingController subTaskController= TextEditingController();

  @override
  void onInit() {
    low=false.obs;
    medium=false.obs;
    high=false.obs;
    approved=false.obs;
    fileBool=false.obs;
    taskTitleTextFieldController = TextEditingController(text: oneTask!.name);
    taskDescriptionTextFieldController  = TextEditingController(text: oneTask!.description);
    addTaskEndTime.value = oneTask!.deadline;

    if(oneTask!.priority == "low"){
      PickLow();
    }
    if(oneTask!.priority == "medium"){
    PickMedium();
    }
    if(oneTask!.priority == "high"){
      PickHigh();
    }
    super.onInit();

  }


  Future editTaskTap(BuildContext context) async {
    if(taskTitleTextFieldController.text != '' && addTaskEndTime.value != null){
      oneTask!.name = taskTitleTextFieldController.text;
      oneTask!.description = taskDescriptionTextFieldController.text;
      oneTask!.deadline = addTaskEndTime.value;
      bool success =await _taskService
          .editTask(
          oneTask!,
          oneTask!.id!,
          context
      );
      if(success){
        _backLogController.allSprints![sprintIndex!].tasks![taskIndex!] = oneTask!;
        _backLogController.update();
        Get.back();
      }

    }
  }


  void PickLow(){
    oneTask!.priority = "low";
    low.value=!low.value;
    medium.value=false;
    high.value=false;
  }
  void PickMedium(){
    oneTask!.priority = "medium";
    medium.value=!medium.value;
    low.value=false;
    high.value=false;
  }
  void PickHigh(){
    oneTask!.priority = "high";
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
