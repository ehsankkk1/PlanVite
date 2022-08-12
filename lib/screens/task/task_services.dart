
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


  Future<Task?> editTask(Task newTask, int taskId,BuildContext context) async {
    loaderBoxGet(context);
    try{
      var headers = {
        'Authorization': 'Bearer ' + UserInformation.User_Token,
      };
      var request = http.MultipartRequest('POST', Uri.parse( ServerConfig.domainNameServer+'tasks/$taskId'));
      request.fields.addAll({
        '_method': 'PUT',
        "name":newTask.name!,
        "priority":newTask.priority!,
        "description":newTask.description!,
        "user_id": newTask.userId.toString(),
        "deadline":newTask.deadline.toString(),
      });
      if( newTask.image !=null){
        request.files.add(await http.MultipartFile.fromPath('image', newTask.image!.path));
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String response1 = await response.stream.bytesToString();
      print(response.statusCode);
      print(response1);
      if (response.statusCode == 200) {
        final body = jsonDecode(response1)["data"];
        var jsonEncode = json.encode(body);
        Task returnTask = oneTaskFromJson(jsonEncode.toString());
        print(response1);
        Get.back();
        return returnTask;
      }
      else {
        print(response.reasonPhrase);
        Get.back();
        String message = jsonDecode(response1)["message"];
        errorMessageBoxGet(message,context);
        return null;
      }
    }on SocketException catch(e){
      print(e);
      errorMessageBoxGet('Network Error', context);
      return null;
    }
  }



}