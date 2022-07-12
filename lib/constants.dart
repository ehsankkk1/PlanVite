import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:plane_vite/config/themes2.dart';
import 'package:plane_vite/storage/secure_storage.dart';
//Color(0xFFFFAAA5)
//pink

var kBackGround=Themes2.theme=='pink'?Color(0xFFFCF8F3).obs:Themes2.theme=='dark'?Color(0xFF3F4E4F).obs:Color(0xFFFFFFFF).obs;
var kDrawerBackGround=Themes2.theme=='pink'?Colors.white.obs:Color(0xFF2C3639).obs;
var kMainPink=Themes2.theme=='pink'?Color(0xFFFFAAA5).obs:Color(0xFF506D84).obs;
var kLightPink=Themes2.theme=='pink'?Color(0xFFFFDFEC).obs:Color(0xFF889EAF).obs;

var kColoredCard=Themes2.theme=='pink'?Color(0xFFFDE3E1).obs:Color(0xFF515E63).obs;
var kWritings =Themes2.theme=='pink'?Color(0xFF698474).obs:Color(0xFF787A91).obs;
var kPriortyColor=Color(0xffFFEAF3).obs;

final BoxShadow kBoxShadow=BoxShadow(
  color: Colors.grey.withOpacity(0.8),
  spreadRadius: 1,
  blurRadius: 3,
  offset: const Offset(0, 4), //changes position of shadow
);


//pink2
//const kBackGround=Color(0xFFfef6e4);
//const kMainPink=Color(0xFFF582AE);
//const kLightPink=Color(0xFFFFDFEC);
//const kWritings =Color(0xFF001858);
//const kColoredCard=Color(0xFF8BD3DD);
// purple
//const kMainPink=Color(0xFFDBA5FF);
//const kLightPink=Color(0xFFEFDAFD);

const kTextFieldFill=Color(0xFFFFFFFF);
const kGrey=Color(0xFFC6C6C6);
double height = Get.height;
double width = Get.width;
const int breakPoint=350;

