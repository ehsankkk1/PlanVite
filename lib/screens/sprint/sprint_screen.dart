import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plane_vite/widgets/app_bar.dart';
import '../../constants.dart';
import '../../widgets/column_header.dart';
import '../../widgets/task_widget.dart';
import '../Drawer/drawer_controller.dart';
import 'sprint_controller.dart';


class SuperSprintScreen extends StatelessWidget {

  final SprintController _sprintController = Get.put(SprintController());
  final MyDrawerController _myDrawerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SprintController>(builder: (logic) {
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: logic.isLoading.value ==false
            ? SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    width * 0.03, height * 0.025, width * 0.03, 0),
                child: AppBarWidget(
                  controller: _myDrawerController,
                  head: 'Sample Project'.tr,
                  backLog: true,
                  onBacklogPressed: () {
                    Get.toNamed(
                      '/backlog', arguments: _sprintController.projectId,);
                  },
                ),
              ),
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: context.theme.primaryColor,
                    color: context.theme.cardColor,
                  ),
                ),
              ),
            ],
          ),
        )
            :logic.listData!.isEmpty
            ?SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    width * 0.03, height * 0.025, width * 0.03, 0),
                child: AppBarWidget(
                  controller: _myDrawerController,
                  head: 'Sample Project'.tr,
                  backLog: true,
                  onBacklogPressed: () {
                    Get.toNamed(
                      '/backlog', arguments: _sprintController.projectId,);
                  },
                ),
              ),
               Expanded(
                child: Center(
                  child:Text('Please Activate Sprint First'.tr
                    ,style: TextStyle(color: context.theme.textTheme.caption!.color,fontSize: 25),)
                ),
              ),
            ],
          ),
        )
          :SprintScreen()

      );
    });
  }
}

class SprintScreen extends GetView<SprintController> {

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;
    final SprintController _sprintController = Get.put(SprintController());
    final MyDrawerController _myDrawerController = Get.find();
    List<BoardList> _lists = [];
    List<BoardItem> items = [];
    for (int i = 0; i < _sprintController.listData!.length; i++) {
      for (int j = 0; j < _sprintController.listData![i].tasks!.length; j++) {
        items.insert(
          j,
          BoardItem(
          draggable: (_sprintController.listData![i].tasks![j].isMyTask!
              || _sprintController.listData![i].tasks![j].isAdmin!),
          onStartDragItem: (int? listIndex, int? itemIndex,
              BoardItemState? state) {

          },
          onDropItem: (int? listIndex, int? itemIndex, int? oldListIndex,
              int? oldItemIndex, BoardItemState? state) async {
            if(listIndex != oldListIndex){
              _sprintController.changeToTrue(oldListIndex,oldItemIndex);
            }


            var item =
            _sprintController.listData![oldListIndex!].tasks![oldItemIndex!];
            _sprintController.listData![oldListIndex].tasks!.removeAt(
                oldItemIndex);
            _sprintController.listData![listIndex!].tasks!.insert(
                itemIndex!, item);

            if(listIndex != oldListIndex){
              bool success = await _sprintController.sprintService.updateTaskStatues(
                  _sprintController.listData![listIndex].status_id!,
                  _sprintController.listData![listIndex].tasks![itemIndex].id!);
              if (success) {
                _sprintController.changeToFalse(listIndex,itemIndex);
              }
            }


            print('listIndex : $listIndex');
            print('itemIndex : $itemIndex');
            //int newStatuesId= _sprintController.listData[listIndex!].tasks[].statusId;

          },
          onTapItem: (int? listIndex, int? itemIndex,
              BoardItemState? state) async {},

          item: TaskWidget(

            image: _sprintController.listData![i].tasks![j].assigneeInfo?.image,


            name: _sprintController.listData![i].tasks![j].name,
            dueDate: _sprintController.listData![i].tasks![j].deadline,
            priority: _sprintController.listData![i].tasks![j].priority,
            loading: _sprintController.listData![i].tasks![j].isloading,
            task:_sprintController.listData![i].tasks![j],
            pinFunction: (){
             _sprintController.pinTask(_sprintController.listData![i].tasks![j].id, context);
            },
          ),),);
      }
      _lists.add(BoardList(
        headerBackgroundColor: context.theme.hintColor,
        backgroundColor: context.theme.hintColor,
        draggable: false,
        header: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(width * 0.01),
                child: ColumnHeader(
                  title: _sprintController.listData![i].statusName,),
              )),
        ],
        items: items,
      ));
      items = [];
    }
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // notification and drawer
            Padding(
              padding: EdgeInsets.fromLTRB(
                  width * 0.03, height * 0.025, width * 0.03, 0),
              child: AppBarWidget(
                controller: _myDrawerController,
                head: 'ِActive Sprint'.tr,
                backLog: true,
                onBacklogPressed: () {
                  Get.toNamed(
                    '/backlog', arguments: _sprintController.projectId,);
                },
              ),
            ),
           Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 10, bottom: 10, right: 10),
                  child: BoardView(
                    scrollbar: true,
                    width: width * 0.85,
                    scrollbarStyle: ScrollbarStyle(
                        color: context.theme.primaryColor,
                        radius: const Radius.circular(3),
                        thickness: 12),
                    lists: _lists,
                    boardViewController: _sprintController
                        .boardViewController,
                  ),
                ))

          ],
        ),
      ),

    );
  }

}


