import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:plane_vite/models/project_users.dart';
import '../../config/server_config.dart';
import '../../config/user_information.dart';
import '../../constants.dart';
import '../../widgets/loader_screen.dart';
import 'package:flutter/material.dart';

class SprintService {


  Future<List<Users>> getProjectUsers(int projectID) async {
    var headers = {
      'Authorization':'Bearer '+UserInformation.User_Token,
    };
    var request = http.Request('GET',
        Uri.parse('https://planvite.herokuapp.com/api/projects/1/users'));

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
}