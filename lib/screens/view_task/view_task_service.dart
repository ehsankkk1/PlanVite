
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../config/user_information.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../models/task_model.dart';


class ViewTaskService{

Future <SubtasksList?> addSubTask(String name,String description,int id,BuildContext context) async{
  loaderBoxGet(context);
    try{
      var headers = {
        'Authorization': 'Bearer ' + UserInformation.User_Token
      };
      var request = http.MultipartRequest('POST',
          Uri.parse('https://planvite.herokuapp.com/api/tasks/$id/subtasks'));

      request.fields.addAll({
        'name': name,
        'description': description,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      print(response.statusCode);
      if (response.statusCode == 200) {
        String response1 = await response.stream.bytesToString();
        final body = jsonDecode(response1)["data"];
        var jsonEncode = json.encode(body);
        SubtasksList oneTaskAdd = subtasksListFromJson(jsonEncode.toString());
        Get.back();
        successMessageBoxGet('${oneTaskAdd.name} \n Added to sub tasks', context);
        return oneTaskAdd;
      }

      else {
        return null;
      }
    }on SocketException catch(e){
      return null;
    }

}


}