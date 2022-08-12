import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:plane_vite/screens/splash/splash_service.dart';
import '../../config/user_information.dart';
import '../../storage/secure_storage.dart';
import '../Drawer/drawer_controller.dart';


class SplashController extends GetxController{
  late SecureStorage storage ;
  late bool validityToken;
  late SplashService _service;

  @override
  void onInit() async{

  await FirebaseMessaging.instance.getToken().then((newToken){
     UserInformation.Fcm_Token=newToken!;

   });
  print(UserInformation.Fcm_Token);
    storage=SecureStorage();
    validityToken=false;
    _service=SplashService();
    await checkToken();

    super.onInit();
  }

  Future<void> checkToken ()async{

    String? token=await storage.read('token');
    print('jjjjjjjjjjj');
    print(token);
    //await Future.delayed(const Duration(seconds: 3));
    if(token != null){

      await validToken(token);
      if(validityToken){

        UserInformation.User_Token = token;
        log("User_Token"+UserInformation.User_Token.toString());
        Get.lazyPut(() => MyDrawerController());
        Get.offAllNamed('/skeleton');
      }
      else {
        EasyLoading.showError(_service.message);
        // Get.offAllNamed('/login');
        Get.offAllNamed('welcome');

      }
    }
    else{
      // Get.offNamed('/login');
      Get.offAllNamed('welcome');

    }
  }
  Future<void> validToken(String token)async{
    validityToken = await _service.checkValid(token,UserInformation.Fcm_Token,Get.locale.toString());
  }

//'f9zbyt03QNaQrULKJrsU6D:APA91bEX7lVRiLa-OY0BU-OQR1IwE6QrT4KywAm2RBdHGnO3rrkrudLs1B2U4UKwP_bVrdxnyuTIFVzG12kkaT-CasQE5GSudnPy9PWskod3to2YV78Pz4Ml8RfQf0zj8n3lPsIw4mhM'

}