import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import '../../config/server_config.dart';
import '../../config/user_information.dart';
import '../../constants.dart';
import '../../models/sprint_model.dart';
import 'back_log_model.dart';
import 'package:flutter/material.dart';

class BackLogService {


  Future<ProjectUser?> addNewUser(int projectID, String email, BuildContext context) async {
    loaderBoxGet(context);
    try {
      var headers = {
        'Authorization': 'Bearer ' + UserInformation.User_Token
      };
      var request = http.Request('POST', Uri.parse(
          ServerConfig.domainNameServer +
              'projects/$projectID/addParticipant?email=$email'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        String response1 = await response.stream.bytesToString();
        final body = jsonDecode(response1)["data"];
        var jsonEncode = json.encode(body);
        ProjectUser projectUser = projectUserFromJson(jsonEncode.toString());
        Get.back();
        successMessageBoxGet('$email Added', context);
        return projectUser;
      }

      if (response.statusCode == 201) {
        Get.back();
        print(await response.stream.bytesToString());
        return null;
      }
      if (response.statusCode == 404) {
        Get.back();
        errorMessageBoxGet('Invalid Email', context);
        print(response.reasonPhrase);
        return null;
      }

      else {
        Get.back();
        errorMessageBoxGet('error', context);
        print(response.reasonPhrase);
        return null;
      }
    } on SocketException catch (e) {
      Get.back();
      errorMessageBoxGet('Network Error', context);
      print(e);
      return null;
    }
  }

  Future<List<Sprint>> getAllSprints(int projectID) async {
    try {
      var headers = {
        'Authorization': 'Bearer ' + UserInformation.User_Token
      };
      var request = http.Request('GET', Uri.parse(
          ServerConfig.domainNameServer + 'projects/$projectID/sprints'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print(response.statusCode);

      if (response.statusCode == 200) {
        String response1 = await response.stream.bytesToString();
        final body = jsonDecode(response1)["data"];
        var jsonEncode = json.encode(body);
        List<Sprint> projectUser = sprintFromJson(jsonEncode.toString());
        //successMessageBoxGet('$email Added',context);
        return projectUser;
      }

      else {
        // errorMessageBoxGet('error',context);
        print(response.reasonPhrase);
        return [];
      }
    } on SocketException catch (e) {
      // errorMessageBoxGet('error',context);
      print(e);
      return [];
    }
  }

  Future<Sprint?> addNewSprint(Sprint newSprint, int projectID,BuildContext context) async {
    loaderBoxGet(context);
    try {
      var headers = {
        'Authorization': 'Bearer ' + UserInformation.User_Token
      };
      var request = http.MultipartRequest('POST', Uri.parse(
          ServerConfig.domainNameServer + 'projects/$projectID/sprints'));
      request.fields.addAll({

        'name': newSprint.name!,
        "deadline": newSprint.deadline.toString(),

      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      print(response.statusCode);
      if (response.statusCode == 201) {
        String response1 = await response.stream.bytesToString();
        final body = jsonDecode(response1)["data"];
        var jsonEncode = json.encode(body);
        Sprint oneSprintAdd = oneSprintFromJson(jsonEncode.toString());
        Get.back();
        successMessageBoxGet('${oneSprintAdd.name} \n Added to Sprints', context);
        //successMessageBoxGet('$email Added',context);
        return oneSprintAdd;
      }
      else {
        Get.back();
        errorMessageBoxGet('Error', context);
        print(response.reasonPhrase);
        return null;
      }
    } on SocketException catch (e) {
      errorMessageBoxGet('Network Error', context);
      return null;
    }
  }
}