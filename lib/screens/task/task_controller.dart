import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/models/project_user_model.dart';
import 'package:plane_vite/screens/task/task_services.dart';
import '../../models/task_model.dart';
import '../back_log/back_log_controller.dart';
import '../sprint/sprint_controller.dart';


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

  List<ProjectUser> allProjectUsers=[];
  int? allUserDropDownValue;


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
    allProjectUsers= _backLogController.allProjectUsers;
    SprintController _sprintController= Get.find();
    taskTitleTextFieldController = TextEditingController(text: oneTask!.name);
    taskDescriptionTextFieldController  = TextEditingController(text: oneTask!.description);

    addTaskEndTime.value = oneTask!.deadline;
    if(oneTask!.userId == 0){
      allUserDropDownValue = null;
    }else{
      allUserDropDownValue = oneTask!.userId;
    }



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
      oneTask!.userId = allUserDropDownValue;
      bool success =await _taskService
          .editTask(
          oneTask!,
          oneTask!.id!,
          context
      );
      if(success){
        _backLogController.allSprints![sprintIndex!].tasks![taskIndex!] = oneTask!;

        for(int i=0;i<allProjectUsers.length;i++){
          if(allProjectUsers[i].id == oneTask!.userId){
            _backLogController.allSprints![sprintIndex!].tasks![taskIndex!].assigneeInfo
            = allProjectUsers[i];
          }
        }
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
