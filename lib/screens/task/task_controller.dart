import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TaskController extends GetxController{


  var low;
  var medium;
  var high;
  var approved;
  var dueDate;
  var fileBool;
  var date;
  var dateBool;
  var year;
  var month;
  var day;
  List subTasks=[].obs;
  TextEditingController subTaskController= TextEditingController();

  @override
  void onInit() {
    low=false.obs;
    medium=false.obs;
    high=false.obs;
    approved=false.obs;
    dueDate=false.obs;
    fileBool=false.obs;
    date='';
    dateBool=false.obs;


    super.onInit();

  }
  void addSubTask(){
    if(subTaskController.text != ''){
      subTasks.add(subTaskController.text);
    }
    print(subTasks);

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
  void PickDueDate(){
    dueDate.value=!dueDate.value;
  }
  void PickFile(){
    fileBool.value=true;
  }
  void PickDate(){

    dateBool.value=true;


  }


}
