import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:plan_vite/screens/bindings/log_in_binding.dart';
import 'package:plan_vite/screens/bindings/sign_up_binding.dart';
import 'package:plan_vite/screens/log_in/log_in_screen.dart';
import 'package:plan_vite/screens/sign_up/sign_up_screen.dart';
import 'package:plan_vite/translations.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations:  Translation(),
      locale: Locale('en'),
      fallbackLocale: Locale('en'),
      initialRoute: '/login',

      getPages: [

        GetPage(name: '/login', page: ()=>LoginScreen(),binding: LoginBinding()),
        GetPage(name: '/signup', page: ()=>SignupScreen(),binding: SignupBinding()),

      ],


      builder: EasyLoading.init(),


    );

  }
}



