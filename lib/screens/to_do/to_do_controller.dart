import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/config/user_information.dart';
import 'package:plane_vite/models/personal_tasks.dart';
import 'package:plane_vite/screens/to_do/to_do_service.dart';


class ToDoController extends GetxController{
var done;
var isLoading=true.obs;
List<Personal> personalList=[];
TodoService service=new TodoService();
List doing =[false,false,false,false,false,false,false].obs;
RxInt count=0.obs;
RxString percent='0'.obs;
var newTask;
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
@override
  void onReady() {
    service.getPersonal(UserInformation.User_Token);
    super.onReady();
  }



}