import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview.dart';
import 'package:boardview/boardview_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plane_vite/widgets/colored_box.dart';

import '../constants.dart';

class BoardItemObject{

  String? title;

  BoardItemObject({this.title}){
    if(this.title == null){
      this.title = "";
    }
  }

}


class BoardListObject{

  String? title;
  List<BoardItemObject>? items;

  BoardListObject({this.title,this.items}){
    if(this.title == null){
      this.title = "";
    }
    if(this.items == null){
      this.items = [];
    }
  }
}

class BoardViewExample extends StatelessWidget {

  final List<BoardListObject> _listData = [
    BoardListObject(title: "List title 1",items: [
      BoardItemObject(title: 'dsaffdsa'),BoardItemObject(title: 'dsaffdsa'),BoardItemObject(title: 'dsaffdsa'),
    ],
    ),
    BoardListObject(title: "List title 2"),
    BoardListObject(title: "List title 3")
  ];


  //Can be used to animate to different sections of the BoardView
  BoardViewController boardViewController = new BoardViewController();


  @override
  Widget build(BuildContext context) {
    List<BoardList> _lists = [];
    for (int i = 0; i < _listData.length; i++) {
      _lists.add(_createBoardList(_listData[i]) as BoardList);
    }
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return true;
      },
      child: BoardView(
        width: width*0.85,
        scrollbarStyle: ScrollbarStyle(),
        lists: _lists,
        boardViewController: boardViewController,
      ),
    );
  }
  Widget _createBoardList(BoardListObject list) {
    List<BoardItem> items = [];
    for (int i = 0; i < list.items!.length; i++) {
      items.insert(i, buildBoardItem(list.items![i]) as BoardItem);
    }

    return BoardList(
      onStartDragList: (int? listIndex) {

      },
      onTapList: (int? listIndex) async {

      },
      onDropList: (int? listIndex, int? oldListIndex) {
        //Update our local list data
        var list = _listData[oldListIndex!];
        _listData.removeAt(oldListIndex!);
        _listData.insert(listIndex!, list);
      },
      headerBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      draggable: false,
      header: [
        Expanded(
            child: Container(
                padding: EdgeInsets.all(5),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Pending",
                      style: TextStyle(
                        fontSize: 20,
                        color: kWritings,
                      ),
                    ),
                    InkWell(
                      child: const Icon(
                        Icons.add,
                        size: 40,
                        color: kMainPink,
                      ),
                      onTap: () {
                        print("tapped");
                      },
                    )
                  ],
                ),
            )
        ),
      ],
      items: items,
    );
  }


  Widget buildBoardItem(BoardItemObject itemObject) {
    return BoardItem(
        onStartDragItem: (int? listIndex, int? itemIndex, BoardItemState? state) {
        },
        onDropItem: (int? listIndex, int? itemIndex, int? oldListIndex,
            int? oldItemIndex, BoardItemState? state) {
          //Used to update our local item data
          var item = _listData[oldListIndex!].items![oldItemIndex!];
          _listData[oldListIndex].items!.removeAt(oldItemIndex!);
          _listData[listIndex!].items!.insert(itemIndex!, item);
        },
        onTapItem: (int? listIndex, int? itemIndex, BoardItemState? state) async {

        },
        item: ColorBox('Build Flutter UwU'));
  }


}