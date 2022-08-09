import 'package:get/get.dart';
import 'package:plane_vite/config/user_information.dart';
import 'package:plane_vite/models/view_task_model.dart';
import 'package:plane_vite/screens/view_task/view_task_service.dart';

class ViewTaskController extends GetxController{
 var isLoading=true.obs;
Data? viewTask;
ViewTaskService service=new ViewTaskService();
 List subTasks=['johny','johny '];
 @override
  void onReady()async {
    viewTask=await service.getViewTask(UserInformation.User_Token,1);
    isLoading(false);
    super.onReady();
  }
}