import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ToDoController extends GetxController{
var done;
List<Rx> doing =[false.obs,false.obs,false.obs,false.obs,false.obs,false.obs,false.obs];
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
  doing[num].value=!doing[num].value;
  print(doing);
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



}