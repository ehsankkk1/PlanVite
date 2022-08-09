import 'package:get/get.dart';
import 'package:plane_vite/config/user_information.dart';
import 'package:plane_vite/models/sub_task_model.dart';
import 'package:plane_vite/models/sub_task_send.dart';
import 'package:plane_vite/models/view_task_model.dart';
import 'package:plane_vite/screens/view_task/view_task_service.dart';

class ViewTaskController extends GetxController{
 var isLoading=true.obs;
 var subTaskdescription='';
 var subTaskName='';
 var message;
 var addSubTaskStatus=false;
Data? viewTask;
List<SubtasksList> subTaskList2=[];
ViewTaskService service=new ViewTaskService();
 List subTasks=['johny','johny '];
 @override
  void onReady()async {
    viewTask=await service.getViewTask(UserInformation.User_Token,1);
    isLoading(false);
    super.onReady();
  }
 Future<void> addSubTaskOnClick() async {
  SubTaskSend subTask = SubTaskSend(

     name:subTaskName,

     description:subTaskdescription,


   );

  subTaskList2 = await service.addSubTask(subTask,UserInformation.User_Token,viewTask!.id);
  viewTask?.subtasksList.add(subTaskList2.first);
  addSubTaskStatus=true;

   isLoading(true);
  // personalList = await service.getPersonal(UserInformation.User_Token);
   //completedTasksToAll=await service.getCompleted(UserInformation.User_Token);
   //completedTasks=double.parse(completedTasksToAll)*personalList.length;

   //completedTasksInt=completedTasks?.round();
   isLoading(false);
   message=service.message;

   if(message is List){
     String temp ='';
     for(String s in message)temp += s + '\n';
     message=temp;


   }
 }
}