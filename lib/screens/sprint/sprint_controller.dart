import 'package:boardview/boardview_controller.dart';
import 'package:get/get.dart';
import '../Drawer/drawer_controller.dart';
import 'sprint_model.dart';


class SprintController extends GetxController{


  var selectedLang;
  var  selectedLangBool ;
  BoardViewController boardViewController=BoardViewController();

  final List<BoardListObject> listData = [
    BoardListObject(title: "Pending",items: [
      BoardItemObject(title: 'Optimize Model',dueDate: 'May 22'),
      BoardItemObject(title: 'Build The app',priority: "High"),
      BoardItemObject(title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis semper ac nulla in pretium. Nunc commodo tempor quam ac ullamcorper. Aliquam erat volutpat.',priority: "Low"),

    ],
    ),
    BoardListObject(title: "Doing",items: [
      BoardItemObject(title: 'Build The app',priority: "High"),
      BoardItemObject(title: 'Aliquam vestibulum magna massa, a rutrum metus semper id. Aenean elementum lectus ac egestas laoreet. Fusce in odio sed ligula egestas tempor.',dueDate: "June 30"),
    ]),
    BoardListObject(title: "Done",items: [
      BoardItemObject(title: 'Optimize Model',priority: "Medium",dueDate: 'May 22'),
    ]),
  ];
  @override
  void onInit() {
    selectedLang='en';
    selectedLangBool = true.obs;
    super.onInit();
  }
@override
  void onClose() {
    // TODO: implement onClose

    super.onClose();
  }

  void changeSelectedLang()async{
    if(selectedLang=='en'){
      selectedLangBool.value=false;
    }
    else{
      selectedLangBool.value=true;
    }
  }
}

