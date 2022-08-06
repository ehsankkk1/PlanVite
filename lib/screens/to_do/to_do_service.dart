import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:plane_vite/models/personal_task.dart';
import 'package:plane_vite/models/personal_task_send.dart';
import 'package:plane_vite/models/personal_tasks.dart';

import '../../config/server_config.dart';

class TodoService{


  var message;
  var url1 = Uri.parse(ServerConfig.domainNameServer + ServerConfig.personal_tasks);



  Future<List<Personal2>>getPersonal(String token)async{
    var response = await http.get(url1,
        headers: {
          'Accept': 'application/json',
          'Authorization':'Bearer '+token,
        }

    );
    print(response.statusCode);
    print(response.body);


    if(response.statusCode==200){
      print('tryyyyy');

      var personal1 = personalFromJson(response.body);
      print(personal1.data.length);
      return personal1.data;
    }else {
      return [];
    }
  }

  Future<bool> addTask(PersonalTaskSend task,String token) async{


    var response = await http.post(

        url1,

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

  Future EditStatus(String token, String status, id) async {
    var url = Uri.parse(
        ServerConfig.domainNameServer + ServerConfig.personal_tasks2 +id+'/change-status');
    var response = await http.put(url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
      body: {

        "completed":status,
      }


    );


    if(response.statusCode==200){
      var jsonResponse = jsonDecode(response.body);
      var personal = personalTaskFromJson(response.body);
      message=jsonResponse['message'];
      return personal.data;
    }
    else if(response.statusCode==401){
      var jsonResponse = jsonDecode(response.body);
      message=jsonResponse['message'];
      return message;
    }
    else{
      return message;
    }

  }




}
