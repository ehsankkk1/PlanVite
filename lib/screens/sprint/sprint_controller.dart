import 'package:boardview/boardview_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:plane_vite/models/active_sprint_model.dart';
import 'package:plane_vite/screens/sprint/sprint_service.dart';
import '../../config/user_information.dart';
import '../../constants.dart';
import '../../models/project_users.dart';
import 'sprint_model.dart';


class SprintController extends GetxController{

  List<Users> usersList=[];
  int projectId = 2;
bool  pinStatus=false;
  final SprintService sprintService = new SprintService();


  BoardViewController boardViewController=BoardViewController();

  List<ActiveSprint> listData = [];

  var isLoading = false.obs;
  @override
  Future<void> onInit() async {

    //print(ProjectInformation.project_id);
    super.onInit();
  }

@override
void onReady() async{

  //usersList=await _service.getProjectUsers(int.parse(ProjectInformation.project_id));
  print(usersList);
    super.onReady();
  }

  void onClose() {
    // TODO: implement onClose

    super.onClose();
  }

  Future<void> onChangeIndex(int index) async {
    isLoading.value = false;
    update();
    projectId = index ;
    listData = await sprintService.getAllColumnsInActiveSprint(projectId);
    print(listData);
    if(listData.isNotEmpty){
      isLoading.value = true;
      update();
    }
  }
  void changeToTrue(int? oldListIndex,int? oldItemIndex){
    listData[oldListIndex!].tasks![oldItemIndex!].isloading = true;
    update();
  }
  void changeToFalse(int? oldListIndex,int? oldItemIndex){
    listData[oldListIndex!].tasks![oldItemIndex!].isloading = false;
    update();
  }
 Future <void> load()async{
    listData = await sprintService.getAllColumnsInActiveSprint(projectId);
    print(listData);
    if(listData.isNotEmpty){
      update();
    }

  }
  void pinTask(id, context)async{
    //isLoading(true);
   // await sprintService.pinTask(UserInformation.User_Token,id);
    loaderBoxGet(context);
     pinStatus=await sprintService.pinTask(UserInformation.User_Token, id);
     Get.back();
    if (pinStatus) {
      successMessageBoxGet(sprintService.message, context);
    } else {
      errorMessageBoxGet(

          sprintService.message, context);

      print('error here');
    }

   // isLoading(false);

  }


}

