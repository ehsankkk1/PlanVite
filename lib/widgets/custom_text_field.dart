import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
String hintText;
IconData icon;
TextInputType? textInputType;
int? fontSize;
TextEditingController? controller2;
FormFieldValidator? validator;
IconData? icon2;
Function()? secureText;
bool  passwordBool;


CustomTextField({required this.hintText,required this.icon,this.textInputType, this.fontSize, this.controller2,this.validator,this.icon2,this.secureText, required this.passwordBool});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(

        style: TextStyle(color:context.theme.canvasColor, ),

        validator: validator,
       controller: controller2,
        obscureText: passwordBool,
        keyboardType: textInputType,


         cursorColor: context.theme.primaryColor,
        decoration: InputDecoration(
          hintText: hintText.tr,
          hintStyle:  TextStyle(
            fontFamily: 'HacenN',
            color: context.theme.textTheme.caption!.color,),
          suffixIcon: GestureDetector(
            onTap: (){

              secureText!();
            },
            child: Icon(
              icon2,
              color:context.theme.textTheme.caption!.color,
            ),
          ),
          prefixIcon: Icon(
            icon,
            color:context.theme.textTheme.caption!.color,
          ),
          filled: true,
          fillColor: context.theme.hintColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:  BorderSide(
                color: context.theme.primaryColor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),

              borderSide:  BorderSide(
                 width: 2,
                color: context.theme.primaryColor,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:  BorderSide(
                color: context.theme.primaryColor,
              )),
        ),
      ),
    );
  }
}
