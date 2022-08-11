import 'package:get/get.dart';
import 'package:plane_vite/config/user_information.dart';
import 'package:plane_vite/models/home_model.dart';
import 'package:plane_vite/screens/home/home_service.dart';



class HomeController extends GetxController{

Data? home;
var isLoading=true.obs;

HomeService service = new HomeService();


  @override
  void onInit() async{
print('johny');
home=await service.getProjects(UserInformation.User_Token);
isLoading(false);

    super.onInit();

  }
  void load()async{
    isLoading(true);
    home=await service.getProjects(UserInformation.User_Token);
    isLoading(false);

  }




}
