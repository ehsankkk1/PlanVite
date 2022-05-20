import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:plane_vite/widgets/app_bar.dart';
import '../../constants.dart';
import '../../widgets/column_header.dart';
import '../../widgets/task_widget.dart';
import '../Drawer/drawer_controller.dart';
import '../Drawer/drawer_screen.dart';
import 'sprint_controller.dart';
import 'sprint_model.dart';

class SprintScreen extends StatelessWidget {
  MyDrawerController _drawerController = Get.put(MyDrawerController());

  @override

  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<MyDrawerController>(
          builder: (_) => ZoomDrawer(
            //duration: Duration(microseconds: 0),
            //reverseDuration: Duration(microseconds: 0),
            moveMenuScreen: true,
            controller: _drawerController.zoomDrawerController,
            menuScreen: const DrawerScreen(),
            mainScreen: _MainScreen(),
            showShadow: true,
            isRtl: false,
            mainScreenOverlayColor: Colors.black.withOpacity(0.5),
            style: DrawerStyle.style1,
            /*        shadowLayer1Color: Colors.grey.withOpacity(0.25),
            shadowLayer2Color: kMainPink,*/
            angle: -0,
            slideWidth: width * 0.90,
          ),
        ),
      ),
    );
  }
}

class _MainScreen extends StatelessWidget {
  MyDrawerController _myDrawerController = Get.find();
  final SprintController _boardController = Get.find();
  @override
  Widget build(BuildContext context) {
    List<BoardList> _lists = [];
    for (int i = 0; i < _boardController.listData.length; i++) {
      _lists.add(_createBoardList(_boardController.listData[i]) as BoardList);
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
                height: height * 0.88,
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
                    boardViewController: _boardController.boardViewController,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _createBoardList(BoardListObject list) {
    List<BoardItem> items = [];
    for (int i = 0; i < list.items!.length; i++) {
      items.insert(i, buildBoardItem(list.items![i]) as BoardItem);
    }
    return BoardList(
      onStartDragList: (int? listIndex) {},
      onTapList: (int? listIndex) async {},
      onDropList: (int? listIndex, int? oldListIndex) {
        //Update our local list data
        var list = _boardController.listData[oldListIndex!];
        _boardController.listData.removeAt(oldListIndex);
        _boardController.listData.insert(listIndex!, list);
      },
      headerBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      draggable: false,
      header: [
        Expanded(
            child: Container(
          padding: const EdgeInsets.all(5),
          child: const ColumnHeader(),
        )),
      ],
      items: items,
    );
  }

  Widget buildBoardItem(BoardItemObject itemObject) {
    return BoardItem(
        draggable: true,
        onStartDragItem:
            (int? listIndex, int? itemIndex, BoardItemState? state) {},
        onDropItem: (int? listIndex, int? itemIndex, int? oldListIndex,
            int? oldItemIndex, BoardItemState? state) {
          //Used to update our local item data
          var item =
              _boardController.listData[oldListIndex!].items![oldItemIndex!];
          _boardController.listData[oldListIndex].items!
              .removeAt(oldItemIndex);
          _boardController.listData[listIndex!].items!.insert(itemIndex!, item);
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
