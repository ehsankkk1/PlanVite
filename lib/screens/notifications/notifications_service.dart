import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../config/server_config.dart';
import '../../models/notifications_model.dart';
class NotificationsService{


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

      var notifications = notificationsFromJson(response.body);
      return notifications.data;
    }else {
      return [];
    }
  }
}
