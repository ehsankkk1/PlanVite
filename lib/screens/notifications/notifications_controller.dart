import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plane_vite/config/user_information.dart';
import 'package:plane_vite/screens/notifications/notifications_service.dart';

import '../../models/notifications_model.dart';



class NotificationsController extends GetxController{

  List<Datum> notificationsList=[];

 // ProductsService _service=ProductsService();
  NotificationsService _service= NotificationsService();


  var isLoading=true.obs;
  var like=false;
  var currentId=0;
  @override
  void onInit() {

    super.onInit();
  }
  @override
  void onReady()async {
  //  productsList= await _service.getProducts(UserInformation.User_Token);
   // isLoading(true);
notificationsList=await _service.getNotifications(UserInformation.User_Token);
    isLoading(false);
    super.onReady();
  }
 Future <void> load()async{
    isLoading(true);
    notificationsList=await _service.getNotifications(UserInformation.User_Token);
    isLoading(false);

  }

}
