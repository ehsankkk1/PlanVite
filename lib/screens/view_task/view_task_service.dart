

import '../../config/server_config.dart';
import '../../models/view_task_model.dart';
import 'package:http/http.dart' as http;

class ViewTaskService{

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


}