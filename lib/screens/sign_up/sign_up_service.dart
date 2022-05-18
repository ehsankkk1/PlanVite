import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../config/server_config.dart';
import '../../models/user.dart';

class SignupService {
  var message;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.register);

  Future<bool> register(User user) async {
    var response = await http.post(url, headers: {
      'Accept': 'application/json',
    }, body: {
      'name': user.userName,
      'email': user.email,
      'password': user.password,
      'confirmPassword': user.confirmPassword,
      'phone': user.phoneNumber,
      'encodedImage':user.encodedImage,
      'imageName':user.imageName,

    });
   // print(response.statusCode);
   // print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['message'];
      return true;
    } else if (response.statusCode == 422) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['message'];
      return false;
    } else {
      return false;
    }
  }
}
