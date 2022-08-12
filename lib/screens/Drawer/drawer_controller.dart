import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:plane_vite/config/user_information.dart';
import 'package:plane_vite/screens/Drawer/drawer_model.dart';
import '../../constants.dart';
import '../../models/user_info_model.dart';
import 'drawer_service.dart';

class MyDrawerController extends GetxController {

  ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  final DrawerServices _drawerServices=DrawerServices();

  Rxn<DateTime> addProjectEndTime = Rxn<DateTime>();
  TextEditingController addProjectTextController = TextEditingController();

  var isLoading=false.obs;
  List<Projects>? allProjects=[];
  Data? userInfo=Data(id: 0, email: '', name: '',rating: 0.0);
  @override

   Future<void> onInit()  async {
    allProjects = await _drawerServices.getProjects(UserInformation.User_Token);
    userInfo = await _drawerServices.getUserInfo(UserInformation.User_Token);

    if(allProjects != null){
      isLoading.value = true;
    }

    super.onInit();
  }
  @override


  void toggleDrawer() async{
    print("Toggle drawer");

    zoomDrawerController.toggle?.call();
  }
  void kickDrawer(){

    zoomDrawerController.close?.call();

    update();
  }

  void showAddProjectField(BuildContext context) {
    var alertDialog = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      actions: [
        TextButton(
          onPressed: () {
            addProjectTextController.clear();
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
            await addNewProjectTap(context);
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
            'Add New Project',
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
            controller: addProjectTextController,
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
              hintText: 'Project Title'.tr,
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
                        addProjectEndTime.value = date;
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
                        addProjectEndTime.value == null
                            ?Text(
                          'Due Date'.tr,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        )
                            :Text(
                          addProjectEndTime.value!.day.toString()+'/'+addProjectEndTime.value!.month.toString()+'/'+addProjectEndTime.value!.year.toString(),
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

  Future addNewProjectTap(BuildContext context) async {
    if(addProjectTextController.text != '' && addProjectEndTime.value != null){
      var projects =await _drawerServices.addNewProject(
        Projects(
            name: addProjectTextController.text,
            deadline: addProjectEndTime.value
        ),
        context,
      );
      addProjectTextController.clear();
      if(projects != null){
        allProjects!.add(projects);
        update();
      }

    }
  }


}
