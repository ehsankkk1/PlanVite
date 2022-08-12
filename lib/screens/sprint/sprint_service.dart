import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:plane_vite/models/project_users.dart';
import '../../config/server_config.dart';
import '../../config/user_information.dart';
import '../../constants.dart';
import '../../models/active_sprint_model.dart';
import '../../widgets/loader_screen.dart';
import 'package:flutter/material.dart';

class SprintService {

var message;
  Future<List<Users>> getProjectUsers(int projectID) async {
    var headers = {
      'Authorization':'Bearer '+UserInformation.User_Token,
    };
    var request = http.Request('GET',
        Uri.parse('https://esraa.yaakoot.com.au/public/api/projects/1/users'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      String response1 = await response.stream.bytesToString();
      final body = jsonDecode(response1)["data"];
      var jsonEncode = json.encode(body);
     // print(body);
     // ProjectUsers projectUser = projectUsersFromJson(body);
      print(body);
      var projectUser = projectUsersFromJson(response1);


      return projectUser.data;
    }
    else {
      print(response.reasonPhrase);
      return [];
    }
  }

  Future<List<ActiveSprint>> getAllColumnsInActiveSprint(int projectID) async {
    try {
      var headers = {
        'Authorization': 'Bearer ' + UserInformation.User_Token
      };
      var request = http.Request('GET', Uri.parse(
          ServerConfig.domainNameServer + 'projects/$projectID/tasks'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print(response.statusCode);

      if (response.statusCode == 200) {
        String response1 = await response.stream.bytesToString();
        final body = jsonDecode(response1)["data"];
        var jsonEncode = json.encode(body);
        List<ActiveSprint> activeSprint = activeSprintFromJson(jsonEncode.toString());
        //successMessageBoxGet('$email Added',context);
        return activeSprint;
      }
      else {
        // errorMessageBoxGet('error',context);
        print(response.reasonPhrase);
        return [];
      }
    } on SocketException catch (e) {
      //errorMessageBoxGet('Network error',context);
      print(e);
      return [];
    }
  }

  Future<bool> updateTaskStatues(int newStatuesId,int taskId) async {
    try{
  var headers = {
    'Authorization': 'Bearer ' + UserInformation.User_Token,
    'Content-Type': 'application/x-www-form-urlencoded'
  };
  var request = http.Request('PUT', Uri.parse(ServerConfig.domainNameServer+'tasks/$taskId/change-status'));
  request.bodyFields = {
    'status_id': newStatuesId.toString(),
  };
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    return true;
  }
  else {
    print(response.reasonPhrase);
    return false;
  }
    }on SocketException catch(e){
      print(e);
      return false;
    }

  }

  Future <bool> pinTask(String token,id)async{
    var url2=Uri.parse(ServerConfig.domainNameServer+'tasks/'+id.toString()+'/pin');
    var response = await http.put(url2,
        headers: {
          'Accept': 'application/json',
          'Authorization':'Bearer '+token,
        }

    );

    print(response.statusCode);
    if(response.statusCode==200){

      return true;
    }
    else {
      return false;
    }

  }


}