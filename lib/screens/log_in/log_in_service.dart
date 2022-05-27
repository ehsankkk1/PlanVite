import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../config/server_config.dart';
import '../../config/user_information.dart';
import '../../models/user.dart';
import '../../storage/secure_storage.dart';

class LoginService {
  var message;
  var token;
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.login);

  Future<bool> login(User user, bool checkBox) async {
    var response = await http.post(url, headers: {
      'Accept': 'application/json',
    }, body: {
      'email': user.email,
      'password': user.password,
    });
    //print(response.statusCode);
    //print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['message'];
      token = jsonResponse['data']['access_token'];
      UserInformation.User_Token = token;
      if (checkBox == true) {
        //save token to device
        SecureStorage storage = SecureStorage();
        await storage.save('token', UserInformation.User_Token);
      }
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
