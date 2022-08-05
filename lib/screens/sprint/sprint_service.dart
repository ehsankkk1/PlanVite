import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plane_vite/config/project_info.dart';

import '../../config/server_config.dart';
import '../../models/project_users.dart';
class ProductsService{
var project_id=ProjectInformation.project_id;

  var message;
  var url = Uri.parse(ServerConfig.domainNameServer + 'https://planvite.herokuapp.com/api/projects//users');


  Future<List<Users>>getProjectUsers(String token)async{
    var response = await http.get(url,
        headers: {
          'Accept': 'application/json',
          'Authorization':'Bearer '+token,
        }

    );
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){

      var products = projectUsersFromJson(response.body);
      return products.data;
    }else {
      return [];
    }
  }
}
