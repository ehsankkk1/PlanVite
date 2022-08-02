

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'drawer_model.dart';

class DrawerServices{


  Future<List<Projects>> getProjects() async {
    try{
      var headers = {
        'Authorization': 'Bearer 30|LAIt0Y8a2tywQiCgaU0V5ZzeUWYWeITQpfLnrDa3'
      };
      var request = http.Request('GET', Uri.parse('https://planvite.herokuapp.com/api/projects'));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String response1 = await response.stream.bytesToString();
        final body = jsonDecode(response1)["data"];
        var jsonEncode=   json.encode(body);
        var projects =projectsFromJson(jsonEncode.toString());
        return projects;
    }
    else {
    log(response.reasonPhrase.toString());
    return [];
    }

    }on SocketException catch(e){
      print(e);
      return [];
    }
  }

}