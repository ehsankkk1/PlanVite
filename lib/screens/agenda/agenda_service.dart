import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../config/server_config.dart';
import '../../models/agenda_model.dart';
class AgendaService{


  var message;
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.notifications);


  Future<List<Datum>>getNotifications(String token)async{
    var response = await http.get(url,
        headers: {
          'Accept': 'application/json',
          'Authorization':'Bearer '+token,
        }

    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){

      var agenda = agendaFromJson(response.body);
      print(agenda);
      return agenda.data;
    }else {
      return [];
    }
  }
   Future <void> unPinTask(String token,id)async{
    var url2=Uri.parse(ServerConfig.domainNameServer+'tasks/'+id.toString()+'pin');
    var response = await http.put(url2,
        headers: {
          'Accept': 'application/json',
          'Authorization':'Bearer '+token,
        }

    );

    print(response.statusCode);

   }


}
