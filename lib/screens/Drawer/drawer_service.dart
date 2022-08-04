
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:plane_vite/config/server_config.dart';
import 'package:plane_vite/config/user_information.dart';
import 'drawer_model.dart';


class DrawerServices{


  Future<List<Projects>> getProjects() async {
    try{
      print("User Token "+ UserInformation.User_Token);
      var headers = {
        'Authorization': 'Bearer '+'37|AKkusDegeyKJ56kCw6Tghj4R1emP4NQSe0zEVSF2'
      };
      var request = http.Request('GET', Uri.parse(ServerConfig.domainNameServer + ServerConfig.projects));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String response1 = await response.stream.bytesToString();
        final body = jsonDecode(response1)["data"];
        var jsonEncode=   json.encode(body);
        var projects = projectsFromJson(jsonEncode.toString());
        return projects;
    }
      else {
    log(response.reasonPhrase.toString());
    return[];
    }

    }on SocketException catch(e){
      print(e);
      return [];
    }
  }

}