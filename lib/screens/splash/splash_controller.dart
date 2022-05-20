import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:plane_vite/screens/splash/splash_service.dart';

import '../../config/user_information.dart';
import '../../storage/secure_storage.dart';


class SplashController extends GetxController{
  late SecureStorage storage ;
  late bool validityToken;
  late SplashService _service;
  @override
  void onInit() async{
    storage=SecureStorage();
    validityToken=false;
    _service=SplashService();
    await checkToken();
    super.onInit();
  }


  Future<void> checkToken ()async{

    String? token=await storage.read('token');
    await Future.delayed(const Duration(seconds: 3));
    if(token != null){

      await validToken(token);
      if(validityToken){
        UserInformation.User_Token=token;
       // Get.offAllNamed('/home');
      }
      else {
        EasyLoading.showError(_service.message);
       // Get.offAllNamed('/login');
        Get.offAllNamed('welcome');

      }
    }else{
     // Get.offNamed('/login');
      Get.offAllNamed('welcome');

    }




  }
  Future<void> validToken(String token)async{
    validityToken = await _service.checkValid(token);
  }



}