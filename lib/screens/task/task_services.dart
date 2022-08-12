
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../config/server_config.dart';
import '../../config/user_information.dart';
import '../../constants.dart';
import '../../models/task_model.dart';
import 'package:http/http.dart' as http;

class TaskService{


  Future<bool> editTask(Task newTask, int taskId,BuildContext context) async {
    loaderBoxGet(context);
    try{
      var headers = {
        'Authorization': 'Bearer ' + UserInformation.User_Token,
        'Content-Type': 'application/x-www-form-urlencoded'
      };
      print(newTask.priority!);
      var request = http.Request('PUT', Uri.parse(ServerConfig.domainNameServer+'tasks/$taskId'));
      request.bodyFields = {
        "name":newTask.name!,
        "priority":newTask.priority!,
        "description":newTask.description!,
        "user_id": newTask.userId.toString(),
        "deadline":newTask.deadline.toString(),
      };
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      String response1 = await response.stream.bytesToString();
      print(response.statusCode);
      print(response1);
      if (response.statusCode == 200) {
        print(response1);
        Get.back();
        return true;
      }
      else {
        print(response.reasonPhrase);
        Get.back();
        String message = jsonDecode(response1)["message"];
        errorMessageBoxGet(message,context);
        return false;
      }
    }on SocketException catch(e){
      print(e);
      errorMessageBoxGet('Network Error', context);
      return false;
    }
  }



}