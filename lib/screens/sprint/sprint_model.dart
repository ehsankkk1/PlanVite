class BoardItemObject {

  String title;
  String? dueDate;
  String? priority;
  BoardItemObject({required this.title,this.dueDate,this.priority});

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