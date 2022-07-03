import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plane_vite/skeleton/skeleton_controller.dart';
import 'package:plane_vite/widgets/app_bar.dart';
import '../../constants.dart';
import '../../widgets/column_header.dart';
import '../../widgets/task_widget.dart';
import '../Drawer/drawer_controller.dart';
import 'sprint_controller.dart';
import 'sprint_model.dart';


class SprintScreen extends GetView<SprintController> {

  @override
  Widget build(BuildContext context) {
    final SprintController _sprintController =  Get.put(SprintController());
    final MyDrawerController _myDrawerController = Get.find();
    List<BoardList> _lists = [];
    for (int i = 0; i < _sprintController.listData.length; i++) {
      _lists.add(_createBoardList(_sprintController.listData[i]) as BoardList);
    }
    return Scaffold(
      backgroundColor: kBackGround,
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
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 10),
                height: width > breakPoint?height * 0.875:height * 0.85,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overScroll) {
                    overScroll.disallowIndicator();
                    return true;
                  },
                  child: BoardView(
                    scrollbar: true,
                    width: width * 0.85,
                    scrollbarStyle: ScrollbarStyle(
                        color: kMainPink,
                        radius: const Radius.circular(5),
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

  Widget _createBoardList(BoardListObject list) {
    final SprintController _sprintController =  Get.find();
    List<BoardItem> items = [];
    for (int i = 0; i < list.items!.length; i++) {
      items.insert(i, buildBoardItem(list.items![i]) as BoardItem);
    }
    return BoardList(
      onStartDragList: (int? listIndex) {},
      onTapList: (int? listIndex) async {},
      onDropList: (int? listIndex, int? oldListIndex) {
        //Update our local list data
        var list = _sprintController.listData[oldListIndex!];
        _sprintController.listData.removeAt(oldListIndex);
        _sprintController.listData.insert(listIndex!, list);
      },
      headerBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      draggable: false,
      header: [
        Expanded(
            child: Container(
          padding:  EdgeInsets.all(width*0.01),
          child: const ColumnHeader(),
        )),
      ],
      items: items,
    );
  }

  Widget buildBoardItem(BoardItemObject itemObject) {
    final SprintController _sprintController =  Get.find();
    return BoardItem(
        draggable: true,
        onStartDragItem:
            (int? listIndex, int? itemIndex, BoardItemState? state) {},
        onDropItem: (int? listIndex, int? itemIndex, int? oldListIndex,
            int? oldItemIndex, BoardItemState? state) {
          //Used to update our local item data
          var item =
          _sprintController.listData[oldListIndex!].items![oldItemIndex!];
          _sprintController.listData[oldListIndex].items!
              .removeAt(oldItemIndex);
          _sprintController.listData[listIndex!].items!.insert(itemIndex!, item);
        },
        onTapItem:
            (int? listIndex, int? itemIndex, BoardItemState? state) async {},
        //Todo : add the task data here
        item: TaskWidget(
          name: 'Build Flutter UwU',
          dueDate: "May 22",
          priority: "High",
        ));
  }
}
