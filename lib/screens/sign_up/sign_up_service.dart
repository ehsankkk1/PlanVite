import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../../config/server_config.dart';
import '../../config/user_information.dart';
import '../../models/user.dart';
import '../../storage/secure_storage.dart';

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
     //'encodedImage':user.encodedImage,
      //'imageName':user.imageName,
      'image':user.imageFile,

    });
    if (response.statusCode == 200) {
      log('200');
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['message'];
      print(jsonResponse);
      String token = jsonResponse['data'];
      UserInformation.User_Token = token;
      SecureStorage storage = SecureStorage();
      await storage.save('token', UserInformation.User_Token);
      return true;
    } else if (response.statusCode == 422) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      message = jsonResponse['message'];
      log('422');
      message = 'server error';
      return false;
    }else if (response.statusCode == 401) {
      log('401');
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      message = jsonResponse['message'];
      message = 'server error';
      return false;
    }
    else {
      message = 'server error';
      return false;
    }
  }
}
