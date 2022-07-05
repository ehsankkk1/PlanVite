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

        validator: validator,
       controller: controller2,
        obscureText: passwordBool,
        keyboardType: textInputType,

         cursorColor: kMainPink.value,
        decoration: InputDecoration(
          hintText: hintText.tr,
          hintStyle:  TextStyle(color: kWritings.value,),
          suffixIcon: GestureDetector(
            onTap: (){

              secureText!();
            },
            child: Icon(
              icon2,
              color: kWritings.value,
            ),
          ),
          prefixIcon: Icon(
            icon,
            color: kWritings.value,
          ),
          filled: true,
          fillColor: kTextFieldFill,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:  BorderSide(
                color: kMainPink.value,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),

              borderSide:  BorderSide(
                 width: 2,
                color: kMainPink.value,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:  BorderSide(
                color: kMainPink.value,
              )),
        ),
      ),
    );
  }
}
