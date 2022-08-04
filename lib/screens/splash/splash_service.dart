import 'package:http/http.dart' as http;
import 'package:plane_vite/config/user_information.dart';

import '../../config/server_config.dart';

class SplashService {
  var message;
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.checkValid);

  Future<bool> checkValid(String token,String fcm_token,String lang) async {
    var response = await http.post(url, headers: {
      'Accept': 'application/json',
      'Authorization':'Bearer '+token,
    },
        body: {
          'fcm_token':fcm_token,
          'language':lang,
        }
    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
      return true;
    }else if (response.statusCode==401){
      message ='Login Please';
      return false;
    }else{
      message = 'Server Error';
      return false;
    }



  }
}
