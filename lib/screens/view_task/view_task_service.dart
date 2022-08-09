

import 'dart:convert';

import 'package:plane_vite/models/sub_task_model.dart';
import 'package:plane_vite/models/sub_task_send.dart';

import '../../config/server_config.dart';
import '../../models/view_task_model.dart';
import 'package:http/http.dart' as http;

class ViewTaskService{
var message;
  Future<Data?>getViewTask(String token,id)async{
    var url=Uri.parse(ServerConfig.domainNameServer + ServerConfig.viewTask +'/'+id.toString() );
    var response = await http.get(url,
        headers: {
          'Accept': 'application/json',
          'Authorization':'Bearer '+token,
        }

    );
    print(response.statusCode);
    print(response.body);


    if(response.statusCode==200){
      print('tryyyyy');

      var viewTask = viewTaskFromJson(response.body);
      print(viewTask.data);
      return viewTask.data;
    }else {
      return null;
    }
  }
Future<List<SubtasksList>> addSubTask(SubTaskSend task,String token,id) async{

  var url1=Uri.parse(ServerConfig.domainNameServer + ServerConfig.sendSubTask +'/'+id.toString() );
  var response = await http.put(

      url1,

      headers: {

        'Accept' : 'application/json',
        'Authorization':'Bearer '+token,


      },

      body: {

        'name':task.name,
        'description':task.description,




      }


  );
  print(response.statusCode);
  print(response.body);


  if(response.statusCode==200){

    var jsonResponse = jsonDecode(response.body);
    var subTask = viewTaskFromJson(response.body);

    message=jsonResponse['message'];
    return subTask.data.subtasksList;
  }
  else if(response.statusCode==401){
    var jsonResponse = jsonDecode(response.body);
    message=jsonResponse['message'];
    return [];
  }
  else{
    return [];
  }

}


}