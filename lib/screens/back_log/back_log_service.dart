import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import '../../config/server_config.dart';
import '../../config/user_information.dart';
import '../../constants.dart';
import '../../widgets/loader_screen.dart';
import 'back_log_model.dart';
import 'package:flutter/material.dart';

class BackLogService{



  Future<ProjectUser?> addNewUser(int projectID,String email,BuildContext context) async {
    loaderBoxGet(context);
    try{

      var headers = {
        'Authorization': 'Bearer '+UserInformation.User_Token
      };
      var request = http.Request('POST', Uri.parse( ServerConfig.domainNameServer + 'projects/$projectID/addParticipant?email=$email'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        String response1 = await response.stream.bytesToString();
        final body = jsonDecode(response1)["data"];
        var jsonEncode=   json.encode(body);
        ProjectUser projectUser = projectUserFromJson(jsonEncode.toString());
        Get.back();
        successMessageBoxGet('$email Added',context);
        return projectUser;
      }

      if (response.statusCode == 201) {
        Get.back();
        print(await response.stream.bytesToString());
        return null;
      }
      if (response.statusCode == 404) {
        Get.back();
        errorMessageBoxGet('Invalid Email',context);
        print(response.reasonPhrase);
        return null;
      }

      else {
        Get.back();
        errorMessageBoxGet('error',context);
        print(response.reasonPhrase);
        return null;
      }
    } on SocketException catch(e){
      Get.back();
      errorMessageBoxGet('error',context);
      print(e);
      return null;
    }


  }
}