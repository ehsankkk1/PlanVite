import 'dart:convert';

import 'package:plane_vite/models/home_model.dart';
import 'package:http/http.dart' as http;

import '../../config/server_config.dart';
class HomeService{





  Future<Data?>getProjects(String token)async{
    var url = Uri.parse(ServerConfig.domainNameServer +'projects');
    var response = await http.get(url,
        headers: {
          'Accept': 'application/json',
          'Authorization':'Bearer '+token,
        }

    );
    print(response.statusCode);
    print(response.body);
    print('resssssssssssssss');

    if(response.statusCode==200){

      var projects = homeFromJson(response.body);

      return projects.data;
    }else {

    }
  }















// Future<Home>getProjects(String token)async{
// print('innnnnnn');
//   var headers = {
//     'Authorization': 'Bearer '+token,
//     'Content-Type': 'application/x-www-form-urlencoded'
//   };
//   var request = http.Request('GET', Uri.parse('https://planvite.herokuapp.com/api/projects'));
//   request.bodyFields = {
//     'user_id': '3'
//   };
//   request.headers.addAll(headers);
//
//   http.StreamedResponse response = await request.send();
//   print('jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj');
//   print(response);
//
//   String response1 = await response.stream.bytesToString();
//
// final body = jsonDecode(response1)["data"];
//
//   if (response.statusCode == 200) {
//
//     final body = jsonDecode(response1)["data"];
//     var jsonEncode = json.encode(body);
//
//     var projects = homeFromJson(jsonEncode.toString());
//
//     print(await response.stream.bytesToString());
//     return projects;
//   }
//   else {
//     print(response.reasonPhrase);
//     return body;
//   }
//
//
// }



}