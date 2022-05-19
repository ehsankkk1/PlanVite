import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:plane_vite/screens/Drawer/drawer_controller.dart';
import 'package:plane_vite/screens/back_log/back_log_screen.dart';
import 'package:plane_vite/screens/bindings/backlog_binding.dart';
import 'package:plane_vite/screens/bindings/board_binding.dart';
import 'package:plane_vite/screens/bindings/home_binding.dart';
import 'package:plane_vite/screens/bindings/log_in_binding.dart';
import 'package:plane_vite/screens/bindings/notifications_binding.dart';
import 'package:plane_vite/screens/bindings/sign_up_binding.dart';
import 'package:plane_vite/screens/bindings/splash_binding.dart';
import 'package:plane_vite/screens/bindings/task_binding.dart';
import 'package:plane_vite/screens/bindings/welcome_binding.dart';
import 'package:plane_vite/screens/board/board_screen.dart';
import 'package:plane_vite/screens/home/home_screen.dart';
import 'package:plane_vite/screens/log_in/log_in_screen.dart';
import 'package:plane_vite/screens/notifications/notifications_screen.dart';
import 'package:plane_vite/screens/sign_up/sign_up_screen.dart';
import 'package:plane_vite/screens/splash/splash_screen.dart';
import 'package:plane_vite/screens/task/task_screen.dart';
import 'package:plane_vite/screens/welcome/welcome_screen.dart';
import 'package:flutter/services.dart';
import 'package:plane_vite/test/test.dart';
import 'translations.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
      locale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      initialRoute: '/board',

      getPages: [
        GetPage(name: '/splash', page: ()=>const SplashScreen(),binding: SplashBinding()),
        GetPage(name: '/login', page: ()=>LoginScreen(),binding: LoginBinding()),
        GetPage(name: '/signup', page: ()=> SignupScreen(),binding: SignupBinding()),
        GetPage(name: '/welcome', page: ()=>const WelcomeScreen(),binding: WelcomeBinding()),
        GetPage(name: '/home', page: ()=>HomeScreen(),binding:HomeBinding()),
        GetPage(name: '/backlog', page: ()=>const BackLogScreen(),binding:BackLogBinding()),
        GetPage(name: '/board', page: ()=>BoardScreen(),binding:BoardBinding()),
        GetPage(name: '/task', page: ()=>TaskScreen(),binding:TaskBinding()),
        GetPage(name: '/notifications', page: ()=>NotificationsScreen(),binding:NotificationsBinding()),
        //GetPage(name: '/test', page: ()=>BoardViewExample()),

      ],
      builder: EasyLoading.init(),
    );

  }
}



