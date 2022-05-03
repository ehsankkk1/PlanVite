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

         cursorColor: kMainPink,
        decoration: InputDecoration(
          hintText: hintText.tr,
          hintStyle: const TextStyle(color: kWritings,),
          suffixIcon: GestureDetector(
            onTap: (){

              secureText!();
            },
            child: Icon(
              icon2,
              color: kWritings,
            ),
          ),
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
                 width: 2,
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
