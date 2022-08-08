import 'package:flutter/material.dart';

class Themes {
  static final pink = ThemeData.light().copyWith(
    backgroundColor: Color(0xFFFCF8F3),
    primaryColor: Color(0xFFFFAAA5),
    cardColor: Color(0xFFFDE3E1),
    textTheme: TextTheme(caption: TextStyle(color: Color(0xFF698474))),
    primaryColorLight: Color(0xFFFFDFEC),
    //drawer color
    hintColor: Colors.white,
      canvasColor: Colors.black54,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFFFAAA5),),

  );
  static final dark = ThemeData.dark().copyWith(
      backgroundColor: const Color(0xFF3F4E4F),
      primaryColor: const Color(0xFF506D84),
      cardColor:const Color(0xFF515E63),
      textTheme: const TextTheme(caption: TextStyle(color: Color(0xFFe8e3e3))),
      primaryColorLight:const Color(0xFF889EAF),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary:const Color(0xFF506D84),),
    canvasColor: Colors.white,
    hintColor: Colors.black38,
  );
  static final blue = ThemeData.light().copyWith(
    backgroundColor:const Color(0xFFFCF8F3),
    primaryColor: Colors.blue,
    cardColor:const Color(0xFFFDE3E1),
    textTheme:const TextTheme(caption: TextStyle(color: Colors.blueGrey)),
    primaryColorLight: Colors.lightBlueAccent,
    //drawer color
    hintColor: Colors.white,

  );
  static final purple = ThemeData.light().copyWith(
    backgroundColor: Color(0xFFFCF8F3),
    primaryColor: Colors.purple,
    cardColor: Color(0xFFFDE3E1),
    textTheme: TextTheme(caption: TextStyle(color: Colors.blueGrey)),
    primaryColorLight: Colors.deepPurple,
    //drawer color
    hintColor: Colors.white,

  );

}