import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../config/server_config.dart';
import '../../config/user_information.dart';
import '../../models/agenda_model.dart';
class AgendaService{


  var message;
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.notifications);


  Future<List<Agenda>>getAgenda()async{
    try{
      var headers = {
        'Authorization': 'Bearer '+ UserInformation.User_Token
      };
      var request = http.Request('GET', Uri.parse(ServerConfig.domainNameServer+'tasks/agenda/pinnedTasks'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String response1 = await response.stream.bytesToString();

      if(response.statusCode==200){
        final body = jsonDecode(response1)["data"];
        var jsonEncode = json.encode(body);
        List<Agenda> allAgenda = agendaFromJson(jsonEncode.toString());
        return allAgenda;
      }else {
        print(response1);
        return [];
      }
    }on SocketException catch(e){
      print(e);
      return [];
    }

  }
   Future <void> unPinTask(String token,id)async{
    var url2=Uri.parse(ServerConfig.domainNameServer+'tasks/'+id.toString()+'/pin');
    var response = await http.put(url2,
        headers: {
          'Accept': 'application/json',
          'Authorization':'Bearer '+token,
        }

    );

    print(response.statusCode);

   }


}
