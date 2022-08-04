import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';



class NotificationsController extends GetxController{

  //List<Datum> productsList=[];
 // ProductsService _service=ProductsService();
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

   // isLoading(false);
    super.onReady();
  }

}
