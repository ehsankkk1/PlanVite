import 'package:flutter/material.dart';

class Themes {
  static final pink = ThemeData.light().copyWith(
    backgroundColor: Color(0xFFFCF8F3),
    primaryColor: Color(0xFFFFAAA5),
    cardColor: Color(0xFFFDE3E1),
    textTheme: TextTheme(caption: TextStyle(color: Color(0xFF698474))),
    primaryColorLight: Color(0xFFFFDFEC),

  );
  static final dark = ThemeData.dark().copyWith(
      backgroundColor: Color(0xFF3F4E4F),
      primaryColor: Color(0xFF506D84),
      cardColor:Color(0xFF515E63),
      textTheme: TextTheme(caption: TextStyle(color: Color(0xFF787A91))),
      primaryColorLight:Color(0xFF889EAF),
  );
}