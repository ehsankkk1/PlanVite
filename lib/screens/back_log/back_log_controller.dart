import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/screens/back_log/back_log_service.dart';
import '../../constants.dart';
import '../../models/sprint_model.dart';
import 'back_log_model.dart';

class BackLogController extends GetxController{

  var selectedLang;
  var  selectedLangBool ;
  var rating=0.obs;
  int projectId = Get.arguments;
  List allProjectUsers =[].obs;
  List<Sprint>? allSprints =[];
  late DateTime addTaskEndTime;
  var isLoading = false.obs;

  TextEditingController addUserTextController = TextEditingController();
  TextEditingController addTaskTextController = TextEditingController();
  final BackLogService _backLogService = BackLogService();

  @override
  Future<void> onInit() async {

    selectedLang='en';
    selectedLangBool = true.obs;
    allSprints = await _backLogService.getAllSprints(projectId);
    print(allSprints);
    if(allSprints != []){
      isLoading.value = true;
    }
    super.onInit();

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
            'Add New User',
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

  void showAddTaskField(BuildContext context) {
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
            'Add New User',
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
                            data: ThemeData.light().copyWith(
                              colorScheme: const ColorScheme.light(),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (date != null) {
                        addTaskEndTime = date;
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
                        Text(
                          'Due Date'.tr,
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


  Future addNewUserTap(BuildContext context) async {
    if(addUserTextController.text != ''){
      var newUser =await _backLogService.addNewUser(1, addUserTextController.text,context);
      addUserTextController.clear();
      if(newUser != null){
        allProjectUsers.add('johny@k');
      }

    }
  }




}
