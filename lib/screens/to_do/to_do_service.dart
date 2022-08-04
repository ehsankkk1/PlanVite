import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:plane_vite/models/personal_tasks.dart';

import '../../config/server_config.dart';

class TodoService{


  var message;
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.personal_tasks);


  Future<List<Personal>>getPersonal(String token)async{
    var response = await http.get(url,
        headers: {
          'Accept': 'application/json',
          'Authorization':'Bearer '+token,
        }

    );
    print(response.statusCode);
    print(response.body);


    if(response.statusCode==200){

      var personal = personalFromJson(response.body);
      return personal.data;
    }else {
      return [];
    }
  }
}
