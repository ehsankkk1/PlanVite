import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plane_vite/screens/view_task/view_task_service.dart';
import '../../constants.dart';
import '../../models/task_model.dart';

class ViewTaskController extends GetxController{



  TextEditingController subTaskDescriptionController = TextEditingController();
  TextEditingController subTaskNameController = TextEditingController();

  Task? viewTask=Get.arguments;


  ViewTaskService service= ViewTaskService();

  @override
  Future<void> onInit() async {

    print(viewTask);
    super.onInit();
  }

  Future<void> addSubTaskOnClick(BuildContext context) async {

    SubtasksList? oneTask =
    await service.addSubTask(
      subTaskNameController.text,
      subTaskDescriptionController.text,
      viewTask!.id!,
      context,
    );
    if(oneTask != null){

      viewTask!.subtasksList!.add(oneTask);
      update();
    }

  }
  void addSubTaskDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
            await addSubTaskOnClick(context);
          },
          child: Text(
            'Add',
            style: TextStyle(fontFamily: 'HacenN',
              color: context.theme.textTheme.caption!.color!,
            ),
          ),
        )
      ],
      backgroundColor: context.theme.backgroundColor,
      title: Center(
          child: Text(
            'Add Subtask',
            style: TextStyle(fontFamily: 'HacenN',
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
            style: TextStyle(fontFamily: 'HacenN',
              color: context.theme.canvasColor,
            ),
            controller: subTaskNameController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            cursorColor: context.theme.primaryColor,
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
              enabledBorder:
              const OutlineInputBorder(borderSide: BorderSide.none),
              hintText: 'Task Name'.tr,
              hintStyle: const TextStyle(fontFamily: 'HacenN',
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          TextField(
            style: TextStyle(fontFamily: 'HacenN',
              color: context.theme.canvasColor,
            ),
            controller: subTaskDescriptionController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            cursorColor: context.theme.primaryColor,
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
              enabledBorder:
              const OutlineInputBorder(borderSide: BorderSide.none),
              hintText: 'Add More Details to this Task'.tr,
              hintStyle: const TextStyle(fontFamily: 'HacenN',

                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.1,
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

}