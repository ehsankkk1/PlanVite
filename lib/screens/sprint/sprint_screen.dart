import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plane_vite/widgets/app_bar.dart';
import '../../widgets/column_header.dart';
import '../../widgets/task_widget.dart';
import '../Drawer/drawer_controller.dart';
import 'sprint_controller.dart';


class SprintScreen extends GetView<SprintController> {

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;
    final SprintController _sprintController =  Get.put(SprintController());
    final MyDrawerController _myDrawerController = Get.find();
    List<BoardList> _lists = [];
    List<BoardItem> items = [];
    for (int i = 0; i < _sprintController.listData.length; i++) {
      for (int j = 0; j < _sprintController.listData[i].items!.length; j++) {
        items.insert(j, BoardItem(
            draggable: true,
            onStartDragItem: (int? listIndex, int? itemIndex, BoardItemState? state) {
              print('listIndex : $listIndex');
              print('itemIndex : $itemIndex');

            },
            onDropItem: (int? listIndex, int? itemIndex, int? oldListIndex, int? oldItemIndex, BoardItemState? state) {
              var item =
              _sprintController.listData[oldListIndex!].items![oldItemIndex!];
              _sprintController.listData[oldListIndex].items!.removeAt(oldItemIndex);
              _sprintController.listData[listIndex!].items!.insert(itemIndex!, item);
            },
            onTapItem: (int? listIndex, int? itemIndex, BoardItemState? state) async {},

            item: TaskWidget(
              name: _sprintController.listData[i].items![j].title,
              dueDate:  _sprintController.listData[i].items![j].dueDate,
              priority:  _sprintController.listData[i].items![j].priority,
              loading: true,
            ),),);
      }
      _lists.add(BoardList(
        headerBackgroundColor: context.theme.hintColor,
        backgroundColor: context.theme.hintColor,
        draggable: false,
        header: [
          Expanded(
              child: Container(
                padding:  EdgeInsets.all(width*0.01),
                child:  ColumnHeader(title: _sprintController.listData[i].title,),
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
                  head: 'Sample Project'.tr,
                  backLog: true,
                  onBacklogPressed: (){
                    Get.toNamed('/backlog',arguments: _sprintController.projectId,);
                  },
                ),
              ),
              Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10,bottom: 10,right: 10),
                    child: BoardView(
                      scrollbar: true,
                      width: width * 0.85,
                      scrollbarStyle: ScrollbarStyle(
                          color: context.theme.primaryColor,
                          radius: const Radius.circular(3),
                          thickness: 12),
                      lists: _lists,
                      boardViewController: _sprintController.boardViewController,
                    ),
                  )),
            ],
          ),
        ),
      );

  }

}


