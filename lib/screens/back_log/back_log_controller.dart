import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/config/user_information.dart';
import 'package:plane_vite/models/statues.dart';
import 'package:plane_vite/models/project_user_model.dart';
import 'package:plane_vite/screens/back_log/back_log_service.dart';
import '../../constants.dart';
import '../../models/sprint_model.dart';
import '../../models/task_model.dart';
import 'package:intl/intl.dart' as Time;

class BackLogController extends GetxController{
var ratingStatus=false;
var kickStatus=false;
var deleteTaskStatus=false;
var userRate;
  var selectedLang;
  var  selectedLangBool ;
  var rating=0.obs;
  int projectId = Get.arguments;
  List<ProjectUser> allProjectUsers =[];
  List<Sprint>? allSprints =[];
  List<Statues>? allStatues =[];
 bool isAdmin=false;
  Rxn<DateTime> addTaskEndTime = Rxn<DateTime>();
  Rxn<DateTime> addSprintEndTime = Rxn<DateTime>();
  var isLoading = false.obs;

  TextEditingController addUserTextController = TextEditingController();
  TextEditingController addTaskTextController = TextEditingController();
  TextEditingController addSprintTextController = TextEditingController();
  TextEditingController addStatuesTextController = TextEditingController();

  final BackLogService _backLogService = BackLogService();

  @override
  Future<void> onInit() async {


    selectedLang='en';
    selectedLangBool = true.obs;
    allSprints = await _backLogService.getAllSprints(projectId);
    allStatues = await _backLogService.getAllStatues(projectId);
    allProjectUsers = await _backLogService.getAllUsers(projectId);
    isAdmin= _backLogService.isAdmin;
    print(isAdmin);
    if(allSprints != [] && allStatues != [] && allProjectUsers != []){
      isLoading.value = true;
    }
    super.onInit();

  }
  void nothing(){}
 void rateUser(userId,context)async{



    loaderBoxGet(context);
    ratingStatus=await _backLogService.rateUser2(UserInformation.User_Token,projectId,userId,userRate.toInt());
    Get.back();
    if (ratingStatus) {
      successMessageBoxGet(_backLogService.message, context);
    } else {
      errorMessageBoxGet(
          Get.locale.toString()=='ar'?'?????? ???? ????????????':
          _backLogService.message, context);

      print('error here');
    }

}
void deleteTask(taskId,context)async{



  loaderBoxGet(context);
  deleteTaskStatus=await _backLogService.deleteTask2(UserInformation.User_Token,taskId);
  Get.back();
  if (deleteTaskStatus) {
    successMessageBoxGet(_backLogService.message, context);
   for(int i=0;i<allSprints!.length;i++){
     for(int j=0;j<allSprints![i].tasks!.length;j++){
       if(allSprints![i].tasks![j].id==taskId){
         allSprints![i].tasks!.removeAt(j);
         update();
       }
     }
   }
  } else {
    errorMessageBoxGet(
        Get.locale.toString()=='ar'?'?????? ???? ????????????':
        _backLogService.message, context);

    print('error here');
  }

}

void kickUser(userId,context, String? email)async{



  loaderBoxGet(context);
  kickStatus=await _backLogService.kickUser2(UserInformation.User_Token,projectId,userId,email);
  Get.back();
  if (kickStatus) {
    successMessageBoxGet(_backLogService.message, context);
    for(int i=0;i<allProjectUsers.length;i++){
      if(allProjectUsers[i].id==userId){
        allProjectUsers.removeAt(i);
        update();
      }
    }
  } else {
    errorMessageBoxGet(
        Get.locale.toString()=='ar'?'?????? ???? ????????????':
        _backLogService.message, context);

    print('error here');
  }

}
  void changeSelectedLang()async{

    if(selectedLang=='ar'){
      selectedLangBool.value=false;
    }
    else{
      selectedLangBool.value=true;
    }

  }

  void showAddUserField(BuildContext context) {
    var alertDialog = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      actions: [
        TextButton(
          onPressed: () {
            addUserTextController.clear();
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              color: context.theme.textTheme.caption!.color!,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
            await addNewUserTap(context);
          },
          child: Text(
            'Add',
            style: TextStyle(
              color: context.theme.textTheme.caption!.color!,
            ),
          ),
        ),
      ],
      backgroundColor: context.theme.backgroundColor,
      title: Center(
          child: Text(
            'Add New User'.tr,
            style: TextStyle(
              color: context.theme.textTheme.caption!.color!,
            ),
          )
      ),
      content: Wrap(
        alignment: WrapAlignment.center,
        children: [
          SizedBox(
            height: height * 0.01,
          ),
          TextField(
            controller: addUserTextController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            cursorColor: context.theme.primaryColor,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
              enabledBorder:
              const OutlineInputBorder(borderSide: BorderSide.none),
              hintText: 'User Email'.tr,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void showAddStatues(BuildContext context) {
    var alertDialog = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      actions: [
        TextButton(
          onPressed: () {
            addStatuesTextController.clear();
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              color: context.theme.textTheme.caption!.color!,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
            await addNewStatusTap(context);
          },
          child: Text(
            'Add',
            style: TextStyle(
              color: context.theme.textTheme.caption!.color!,
            ),
          ),
        ),
      ],
      backgroundColor: context.theme.backgroundColor,
      title: Center(
          child: Text(
            'Add New Statues'.tr,
            style: TextStyle(
              color: context.theme.textTheme.caption!.color!,
            ),
          )
      ),
      content: Wrap(
        alignment: WrapAlignment.center,
        children: [
          SizedBox(
            height: height * 0.01,
          ),
          TextField(
            controller: addStatuesTextController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            cursorColor: context.theme.primaryColor,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
              enabledBorder:
              const OutlineInputBorder(borderSide: BorderSide.none),
              hintText: 'Statues name'.tr,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void showAddTaskField(int index,int sprintId,BuildContext context) {
    var alertDialog = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      actions: [
        TextButton(
          onPressed: () {
            addTaskTextController.clear();
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              color: context.theme.textTheme.caption!.color!,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
            await addNewTaskTap(index,sprintId,context);
          },
          child: Text(
            'Add',
            style: TextStyle(
              color: context.theme.textTheme.caption!.color!,
            ),
          ),
        ),
      ],
      backgroundColor: context.theme.backgroundColor,
      title: Center(
          child: Text(
            'Add New Task'.tr,
            style: TextStyle(
              color: context.theme.textTheme.caption!.color!,
            ),
          )
      ),
      content: Wrap(
        alignment: WrapAlignment.center,
        children: [
          SizedBox(
            height: height * 0.01,
          ),
          TextField(
            controller: addTaskTextController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            cursorColor: context.theme.primaryColor,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
              enabledBorder:
              const OutlineInputBorder(borderSide: BorderSide.none),
              hintText: 'Task Title'.tr,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            children: [
              SizedBox(
                width: width * 0.02,
              ),
              Obx(() {
                return GestureDetector(
                    onTap: () async {
                      var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData().copyWith(

                              colorScheme: ColorScheme.dark(
                                primary: context.theme.primaryColor,
                                onPrimary: context.theme.textTheme
                                    .caption!.color!,
                                surface: context.theme.primaryColor,

                                onSurface: context.theme.textTheme
                                    .caption!.color!,

                              ),
                              dialogBackgroundColor: context.theme.hintColor,

                            ),
                            child: child!,
                          );
                        },
                      );
                      if (date != null) {
                        addTaskEndTime.value = date;
                      }
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          color:  context.theme.primaryColor,
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        addTaskEndTime.value == null
                            ?Text(
                          'Due Date'.tr,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        )
                            :Text(
                          Time.DateFormat.yMEd().format(addTaskEndTime.value!),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ));
              }),


            ],
          ),
        ],
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void showAddSprintField(BuildContext context) {
    var alertDialog = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      actions: [
        TextButton(
          onPressed: () {
            addSprintTextController.clear();
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              color: context.theme.textTheme.caption!.color!,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
            await addNewSprintTap(context);
          },
          child: Text(
            'Add',
            style: TextStyle(
              color: context.theme.textTheme.caption!.color!,
            ),
          ),
        ),
      ],
      backgroundColor: context.theme.backgroundColor,
      title: Center(
          child: Text(
            'Add New Sprint'.tr,
            style: TextStyle(
              color: context.theme.textTheme.caption!.color!,
            ),
          )
      ),
      content: Wrap(
        alignment: WrapAlignment.center,
        children: [
          SizedBox(
            height: height * 0.01,
          ),
          TextField(
            controller: addSprintTextController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            cursorColor: context.theme.primaryColor,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
              enabledBorder:
              const OutlineInputBorder(borderSide: BorderSide.none),
              hintText: 'Sprint Title'.tr,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            children: [
              SizedBox(
                width: width * 0.02,
              ),
              Obx(() {
                return GestureDetector(
                    onTap: () async {
                      var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                        builder: (BuildContext context, Widget? child) {
                          return
                          Theme(
                          data: ThemeData().copyWith(

                          colorScheme: ColorScheme.dark(
                          primary: context.theme.primaryColor,
                          onPrimary: context.theme.textTheme
                              .caption!.color!,
                          surface: context.theme.primaryColor,

                          onSurface: context.theme.textTheme
                              .caption!.color!,

                          ),
                          dialogBackgroundColor: context.theme.hintColor,

                          ),
                          child: child!,
                          );
                        },
                      );
                      if (date != null) {
                        addSprintEndTime.value = date;
                      }
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          color:  context.theme.primaryColor,
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        addSprintEndTime.value == null
                            ?Text(
                          'Due Date'.tr,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        )
                            :Text(
                          Time.DateFormat.yMEd().format(addSprintEndTime.value!),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                );
              }),


            ],
          ),
        ],
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }


  Future addNewUserTap(BuildContext context) async {
    if(addUserTextController.text != ''){
      print( addUserTextController.text);
      var newUser =await _backLogService.addNewUser(projectId, addUserTextController.text,context);

      if(newUser != null){
        allProjectUsers.add(newUser);
        update();
      }
      addUserTextController.clear();
    }
  }


  Future addNewSprintTap(BuildContext context) async {
    if(addSprintTextController.text != '' && addSprintEndTime.value != null){
      var newSprint =await _backLogService.addNewSprint(
          Sprint(
              name: addSprintTextController.text,
              deadline: addSprintEndTime.value
          ),
          projectId,
          context,
      );
      addSprintTextController.clear();
      if(newSprint != null){
        allSprints!.add(newSprint);
        update();
      }

    }
  }

  Future addNewStatusTap(BuildContext context) async {
    if(addStatuesTextController.text != ''){
      List<Statues> newStatues =await _backLogService.addNewStatues(
          projectId,
          addStatuesTextController.text,
          context
      );
      addSprintTextController.clear();
      if(newStatues.isNotEmpty){
        allStatues = newStatues;
        update();
      }

    }
  }

  Future addNewTaskTap(int index,int sprintId,BuildContext context) async {
    if(addTaskTextController.text != '' && addTaskEndTime.value != null){
      var newTask =await _backLogService.addNewTask(
        Task(
            name: addTaskTextController.text,
            deadline: addTaskEndTime.value,
        ),
        sprintId,
        context,
      );
      addTaskTextController.clear();
      if(newTask != null){
        allSprints![index].tasks!.add(newTask);
        update();
      }

    }
  }


  Future toggleSprintValue(int index,BuildContext context) async {
    bool? newValue= await _backLogService.toggleActiveSprint(
        allSprints![index].id!,
        context,
    );
    if(newValue != null){
      allSprints![index].isActive = newValue;
    }
   update();
  }


}
