import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:plane_vite/models/personal_task_send.dart';
import 'package:plane_vite/models/personal_tasks.dart';

import '../../config/server_config.dart';

class TodoService{


  var message;
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.personal_tasks);



  Future<List<Personal2>>getPersonal(String token)async{
    var response = await http.get(url,
        headers: {
          'Accept': 'application/json',
          'Authorization':'Bearer '+token,
        }

    );
    //print(response.statusCode);
   // print(response.body);


    if(response.statusCode==200){

      var personal = personalFromJson(response.body);
      print(personal.data.length);
      return personal.data;
    }else {
      return [];
    }
  }

  Future<bool> addTask(PersonalTask task,String token) async{


    var response = await http.post(

        url,

        headers: {

          'Accept' : 'application/json',
          'Authorization':'Bearer '+token,


        },

        body: {

          'name':task.name,
          'description':task.description,
          'deadline':task.deadline,
          'priority':task.priority,


        }


    );
    print(response.statusCode);
    print(response.body);


    if(response.statusCode==200){
      var jsonResponse = jsonDecode(response.body);
      message=jsonResponse['message'];
      return true;
    }
    else if(response.statusCode==401){
      var jsonResponse = jsonDecode(response.body);
      message=jsonResponse['message'];
      return false;
    }
    else{
      return false;
    }

  }



}
