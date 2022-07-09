import 'package:boardview/boardview_controller.dart';
import 'package:get/get.dart';
import '../Drawer/drawer_controller.dart';
import 'sprint_model.dart';


class SprintController extends GetxController{


  var selectedLang;
  var  selectedLangBool ;
  BoardViewController boardViewController=BoardViewController();

  final List<BoardListObject> listData = [
    BoardListObject(title: "List title 1",items: [
      BoardItemObject(title: 'dsaffdsa'),BoardItemObject(title: 'dsaffdsa'),BoardItemObject(title: 'dsaffdsa'),
      BoardItemObject(title: 'dsaffdsa'),BoardItemObject(title: 'dsaffdsa'),
    ],
    ),
    BoardListObject(title: "List title 2",items: [
      BoardItemObject(title: 'dsaffdsa'),BoardItemObject(title: 'dsaffdsa'),
    ]),
    BoardListObject(title: "List title 3",items: [
      BoardItemObject(title: 'dsaffdsa'),
    ])
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

