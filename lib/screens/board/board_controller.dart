import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class BoardController extends GetxController{


  var selectedLang;
  var  selectedLangBool ;
  final scrollController = ScrollController();

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
  void jumpToItem( context ,int item) {
    final width = scrollController.position.maxScrollExtent +
        context.size.width;
    final value = item / 4 * width;
    final valueSpace = 15 + value;
    final newValue = valueSpace > scrollController.position.maxScrollExtent
        ? scrollController.position.maxScrollExtent
        : valueSpace;
   // scrollController.jumpTo(value);
    scrollController.animateTo(value, duration: const Duration(milliseconds: 400), curve: Curves.ease);
  }

}
