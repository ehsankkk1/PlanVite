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

    var headers = {
    'Authorization': 'Bearer '+UserInformation.User_Token
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://esraa.yaakoot.com.au/public/api/register'));
    request.fields.addAll({
    'name': user.userName.toString(),
    'email': user.email.toString(),
    'password': user.password.toString(),
    'confirmPassword': user.confirmPassword.toString(),
    'phone': user.phoneNumber.toString(),
    });
    if(user.imageFile != null){
      request.files.add(
          await http.MultipartFile.fromPath('image', user.imageFile!.path)
      );
    }

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String response1 = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      log('200');
      final body = jsonDecode(response1)["data"];
      print(body);
      String token = body;

      UserInformation.User_Token = token;
      SecureStorage storage = SecureStorage();
      await storage.save('token', UserInformation.User_Token);
      return true;
    } else if (response.statusCode == 422) {
      final body = jsonDecode(response1)["message"];
      print(body);
      message = body;
      log('422');
      message = 'server error';
      return false;
    }else if (response.statusCode == 401) {
      log('401');
      final body = jsonDecode(response1)["message"];
      message = 'server error';
      return false;
    }
    else {
      message = 'server error';
      return false;
    }
  }
}
