import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
String hintText;
IconData icon;
TextInputType? textInputType;
int? fontSize;
Function(String)? onChange;
CustomTextField({required this.hintText,required this.icon,this.textInputType, this.fontSize, this.onChange});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
       onChanged : onChange,




        keyboardType: textInputType,

         cursorColor: kMainPink,
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
                color: kMainPink,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(

                color: kMainPink,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: kMainPink,
              )),
        ),
      ),
    );
  }
}
