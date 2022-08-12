import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/config/user_information.dart';
import 'package:plane_vite/models/completed_personal_tasks_model.dart';
import 'package:plane_vite/models/personal_task_send.dart';
import 'package:plane_vite/models/personal_tasks.dart';
import 'package:plane_vite/screens/agenda/agenda_service.dart';
import 'package:plane_vite/screens/to_do/to_do_service.dart';


import '../../models/agenda_model.dart';
import '../../models/personal_task.dart';



class AgendaController extends GetxController{

  List<Datum> agendaList=[];

  // ProductsService _service=ProductsService();
  AgendaService _service= AgendaService();


  var isLoading=true.obs;
  var like=false;
  var currentId=0;
  @override
  void onInit() {

    super.onInit();
  }
  @override
  void onReady()async {

    agendaList=await _service.getNotifications(UserInformation.User_Token);
    isLoading(false);
    super.onReady();
  }
  void unPin(id)async{
    isLoading(true);
    await _service.unPinTask(UserInformation.User_Token,id);
    agendaList=await _service.getNotifications(UserInformation.User_Token);
    isLoading(false);

  }
  void load()async{

    isLoading(true);
    agendaList=await _service.getNotifications(UserInformation.User_Token);
    isLoading(false);

  }


}