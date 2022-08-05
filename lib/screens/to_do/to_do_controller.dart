import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/config/user_information.dart';
import 'package:plane_vite/models/personal_task_send.dart';
import 'package:plane_vite/models/personal_tasks.dart';
import 'package:plane_vite/screens/to_do/to_do_service.dart';


class ToDoController extends GetxController{
var done;
var isLoading=true.obs;
List<Personal2> personalList=[];
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
void PutFalse(String status,int id)async{
  isLoading(true);
  personalList=await service.EditStatus(UserInformation.User_Token,status,id.toString());
  isLoading(false);
}

void PutTrue(String status,int id)async{
  isLoading(true);
  personalList=await service.EditStatus(UserInformation.User_Token,status,id.toString());
  isLoading(false);
}
@override
  void onReady() async{
  print('johny1');
    personalList=await service.getPersonal(UserInformation.User_Token);
  print('johny2');
  //  print(personalList[0].name);
    isLoading(false);

    super.onReady();
  }

Future<void> addTaskOnClick() async {
  PersonalTask task = PersonalTask(

    name:name,
    deadline:date,
    priority:'low',
    description:description,


  );

  addTaskStatus = await service.addTask(task,UserInformation.User_Token);
  message=service.message;

  if(message is List){
    String temp ='';
    for(String s in message)temp += s + '\n';
    message=temp;


  }
}


}