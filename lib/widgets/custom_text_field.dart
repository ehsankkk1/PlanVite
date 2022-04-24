import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
String hintText;
IconData icon;
TextInputType? textInputType;
int? fontSize;
CustomTextField({required this.hintText,required this.icon,this.textInputType, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        keyboardType: textInputType,

         cursorColor: kTextFieldBorder,
        decoration: InputDecoration(
          hintText: hintText.tr,
          hintStyle: const TextStyle(color: kWritings,),
          prefixIcon: Icon(
            icon,
            color: kWritings,
          ),
          filled: true,
          fillColor: kTextFieldFill,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: kTextFieldBorder,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(

                color: kTextFieldBorder,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: kTextFieldBorder,
              )),
        ),
      ),
    );
  }
}
