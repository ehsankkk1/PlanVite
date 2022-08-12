
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:plane_vite/config/server_config.dart';
import 'package:plane_vite/config/user_information.dart';

import '../../constants.dart';
import '../../models/user_info_model.dart';
import 'drawer_model.dart';


class DrawerServices{


  Future<List<Projects>?> getProjects(String token) async {
    try{

      var headers = {
        'Authorization': 'Bearer '+token
      };
      var request = http.Request('GET', Uri.parse(ServerConfig.domainNameServer + ServerConfig.projects));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      print(response.statusCode);
      if (response.statusCode == 200) {
        String response1 = await response.stream.bytesToString();
        final body = jsonDecode(response1)["data"]["projects"];
        var jsonEncode=   json.encode(body);
        var projects = projectsFromJson(jsonEncode.toString());
        return projects;
    }

      else {
    log(response.reasonPhrase.toString());
    return null;
    }

    }on SocketException catch(e){
      print(e);
      return null;
    }
  }


  var url2 = Uri.parse(ServerConfig.domainNameServer + ServerConfig.userInfo);

  Future<Data?>getUserInfo(String token)async{
    var response = await http.get(url2,
        headers: {
          'Accept': 'application/json',
          'Authorization':'Bearer '+token,
        }

    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){

      var userInfo = userInfoFromJson(response.body);
      return userInfo.data;
    }else {
      return null;
    }
  }

  Future<Projects?> addNewProject(Projects newProject,BuildContext context) async {
    loaderBoxGet(context);
    try {
      var headers = {
        'Authorization': 'Bearer ' + UserInformation.User_Token
      };
      var request = http.MultipartRequest('POST', Uri.parse(
          ServerConfig.domainNameServer + 'projects'));
      request.fields.addAll({

        'name': newProject.name!,
        "deadline": newProject.deadline.toString(),

      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      print(response.statusCode);

      String response1 = await response.stream.bytesToString();
      if (response.statusCode == 201) {
        final body = jsonDecode(response1)["data"];
        var jsonEncode = json.encode(body);
        Projects oneProjectAdd = oneProjectsFromJson(jsonEncode.toString());
        Get.back();
        successMessageBoxGet('${oneProjectAdd.name} \n' +'Added to Projects'.tr, context);
        //successMessageBoxGet('$email Added',context);
        return oneProjectAdd;
      }
      else if(response.statusCode == 422){
        Get.back();
        String message = jsonDecode(response1)["errors"]["deadline"][0];
        errorMessageBoxGet(message, context);
        print(response.reasonPhrase);
        return null;
      }
      else {
        Get.back();
        errorMessageBoxGet('Error', context);
        print(response.reasonPhrase);
        return null;
      }
    } on SocketException catch (e) {
      Get.back();
      errorMessageBoxGet('Network Error', context);
      return null;
    }
  }


}