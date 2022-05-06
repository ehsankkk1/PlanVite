import 'package:http/http.dart' as http;

import '../../config/server_config.dart';

class SplashService {
  var message;
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.checkValid);

  Future<bool> checkValid(String token) async {
    var response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization':'Bearer '+token,
    }, );
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
