import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/config/user_information.dart';
import 'package:plane_vite/models/completed_personal_tasks_model.dart';
import 'package:plane_vite/models/personal_task_send.dart';
import 'package:plane_vite/models/personal_tasks.dart';
import 'package:plane_vite/screens/to_do/to_do_service.dart';

import '../../models/personal_task.dart';


class ToDoController extends GetxController{
var done;
var isLoading=true.obs;
var isLoading2=false.obs;
List<Personal2> personalList=[];
List<Data> personalTask=[];
String completedTasksToAll='';
late double completedTasks;
late int completedTasksInt;

TodoService service=new TodoService();
List doing =[false,false,false,false,false,false,false].obs;
var count=0.obs;
RxString percent='0'.obs;
var message;
var addTaskStatus=false;
var description;
var name;
var dateBool;
var year;
var month;
var day;
var date;
@override
  void onInit() {
  done = false.obs;
  dateBool=false.obs;
  date='';
    super.onInit();
  }
  void Done(){

  done.value=!done.value;
  }
  void Doing(num){
  doing[num]=!doing[num];
  print(doing);
  }
  void onTodoTap(index){
    Doing(index);
    if (doing[index]) {
      count.value++;
      percent.value =
          (count.toInt() /
              doing.length *
              100)
              .toInt()
              .toString();
    }
    else {
      count.value--;
      percent.value = (count.toInt() / doing.length * 100).toInt().toString();
    }
  }
  void Calc(){
   // count=0.obs;
  for(int i=0;i<doing.length;i++){

    if(doing[i]==true){
      count.value++;
    }
  }

  }
void PickDate(){

  dateBool.value=true;


}
void PutFalse(String status,int id) async{
  isLoading2(true);
  print("johny1");
  await service.EditStatus(UserInformation.User_Token,status,id.toString());
  print("edit done");
  personalList=await service.getPersonal(UserInformation.User_Token);
  completedTasksToAll=await service.getCompleted(UserInformation.User_Token);
  completedTasks=double.parse(completedTasksToAll)*personalList.length;
  completedTasksInt=completedTasks.round();
  print("get done");
  isLoading2(false);
}

void PutTrue(String status,int id) async{
  isLoading2(true);
  print("johny1");
  await  service.EditStatus(UserInformation.User_Token,status,id.toString());
  print("edit done");
  personalList=await service.getPersonal(UserInformation.User_Token);
  completedTasksToAll=await service.getCompleted(UserInformation.User_Token);
  completedTasks=double.parse(completedTasksToAll)*personalList.length;
  completedTasksInt=completedTasks.round();
  print("get done");
  isLoading2(false);
}
@override
  void onReady() async{
  print('johny1');
    personalList=await service.getPersonal(UserInformation.User_Token);
  completedTasksToAll=await service.getCompleted(UserInformation.User_Token);
  completedTasks=double.parse(completedTasksToAll)*personalList.length;
  completedTasksInt=completedTasks.round();

  print('johny2');
  //  print(personalList[0].name);
    isLoading(false);

    super.onReady();
  }

Future<void> addTaskOnClick() async {
  PersonalTaskSend task = PersonalTaskSend(

    name:name,
    deadline:date,
    priority:'low',
    description:description,


  );

  addTaskStatus = await service.addTask(task,UserInformation.User_Token);
  isLoading(true);
  personalList = await service.getPersonal(UserInformation.User_Token);
  completedTasksToAll=await service.getCompleted(UserInformation.User_Token);
  completedTasks=double.parse(completedTasksToAll)*personalList.length;
  completedTasksInt=completedTasks.round();
  isLoading(false);
  message=service.message;

  if(message is List){
    String temp ='';
    for(String s in message)temp += s + '\n';
    message=temp;


  }
}
void DeleteTask(int id)async{
  isLoading(true);
  await service.DeleteTask(UserInformation.User_Token,id.toString());
  personalList=await service.getPersonal(UserInformation.User_Token);
  completedTasksToAll=await service.getCompleted(UserInformation.User_Token);
  completedTasks=double.parse(completedTasksToAll)*personalList.length;
  completedTasksInt=completedTasks.round();

  isLoading(false);

}

}