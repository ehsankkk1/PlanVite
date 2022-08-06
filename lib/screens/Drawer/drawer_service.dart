
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:plane_vite/config/server_config.dart';
import 'package:plane_vite/config/user_information.dart';
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
        final body = jsonDecode(response1)["data"];
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

}