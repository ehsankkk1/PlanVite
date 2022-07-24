import 'dart:convert';

import '../../config/server_config.dart';
import 'package:http/http.dart' as http;



class SettingsService {
  var message;
  var token;
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.logout);

  Future<bool> logout(String token) async {
    var response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization':'Bearer '+token,
    }, );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['message'];

      return true;
    } else if (response.statusCode == 422) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['message'];
      return false;
    } else if (response.statusCode == 401) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['message'];
      return false;
    } else {
      message = 'server error';
      return false;
    }
  }



}
