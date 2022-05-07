import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:plane_vite/screens/Drawer/drawer_controller.dart';
import 'package:plane_vite/screens/bindings/board_binding.dart';
import 'package:plane_vite/screens/bindings/home_binding.dart';
import 'package:plane_vite/screens/bindings/log_in_binding.dart';
import 'package:plane_vite/screens/bindings/sign_up_binding.dart';
import 'package:plane_vite/screens/bindings/splash_binding.dart';
import 'package:plane_vite/screens/bindings/welcome_binding.dart';
import 'package:plane_vite/screens/board/board_screen.dart';
import 'package:plane_vite/screens/home/home_screen.dart';
import 'package:plane_vite/screens/log_in/log_in_screen.dart';
import 'package:plane_vite/screens/sign_up/sign_up_screen.dart';
import 'package:plane_vite/screens/splash/splash_screen.dart';
import 'package:plane_vite/screens/welcome/welcome_screen.dart';
import 'package:flutter/services.dart';


import 'translations.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Get.put<MyDrawerController>(MyDrawerController());
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
      locale: const Locale('ar'),
      fallbackLocale: const Locale('en'),
      initialRoute: '/board',

      getPages: [
        GetPage(name: '/splash', page: ()=>SplashScreen(),binding: SplashBinding()),
        GetPage(name: '/login', page: ()=>LoginScreen(),binding: LoginBinding()),
        GetPage(name: '/signup', page: ()=> SignupScreen(),binding: SignupBinding()),
        GetPage(name: '/welcome', page: ()=>const WelcomeScreen(),binding: WelcomeBinding()),
        GetPage(name: '/home', page: ()=>HomeScreen(),binding:HomeBinding()),
        GetPage(name: '/board', page: ()=>BoardScreen(),binding:BoardBinding()),

      ],


      builder: EasyLoading.init(),


    );

  }
}



