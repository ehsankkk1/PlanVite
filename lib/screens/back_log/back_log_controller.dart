import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/screens/back_log/back_log_service.dart';
import '../../constants.dart';
import 'back_log_model.dart';

class BackLogController extends GetxController{

  var selectedLang;
  var  selectedLangBool ;
  var rating=0.obs;
  List allProjectUsers =[].obs;
  TextEditingController addUserTextController = TextEditingController();
  final BackLogService _backLogService = BackLogService();

  @override
  void onInit() {

    selectedLang='en';
    selectedLangBool = true.obs;

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
            Navigator.pop(context);
          },
          child: Text(
            'Cancle',
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

  Future addNewUserTap(BuildContext context) async {

    var newUser =await _backLogService.addNewUser(1, 'johny@k',context);

    if(newUser != null){
      allProjectUsers.add('johny@k');
    }


  }

}
