import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:plane_vite/config/themes2.dart';
import 'package:plane_vite/screens/Drawer/drawer_controller.dart';
import 'package:plane_vite/screens/Drawer/drawer_screen.dart';
import 'package:plane_vite/screens/back_log/back_log_screen.dart';
import 'package:plane_vite/screens/bindings/backlog_binding.dart';
import 'package:plane_vite/screens/bindings/sprint_binding.dart';
import 'package:plane_vite/screens/bindings/drawer_binding.dart';
import 'package:plane_vite/screens/bindings/home_binding.dart';
import 'package:plane_vite/screens/bindings/log_in_binding.dart';
import 'package:plane_vite/screens/bindings/notifications_binding.dart';
import 'package:plane_vite/screens/bindings/sign_up_binding.dart';
import 'package:plane_vite/screens/bindings/skeleton_binding.dart';
import 'package:plane_vite/screens/bindings/splash_binding.dart';
import 'package:plane_vite/screens/bindings/task_binding.dart';
import 'package:plane_vite/screens/bindings/test_binding.dart';
import 'package:plane_vite/screens/bindings/to_do_binding.dart';
import 'package:plane_vite/screens/bindings/welcome_binding.dart';
import 'package:plane_vite/screens/settings/settings_screen.dart';
import 'package:plane_vite/screens/sprint/sprint_screen.dart';
import 'package:plane_vite/screens/home/home_screen.dart';
import 'package:plane_vite/screens/log_in/log_in_screen.dart';
import 'package:plane_vite/screens/notifications/notifications_screen.dart';
import 'package:plane_vite/screens/sign_up/sign_up_screen.dart';
import 'package:plane_vite/screens/splash/splash_screen.dart';
import 'package:plane_vite/screens/task/task_screen.dart';
import 'package:plane_vite/screens/to_do/to_do_screen.dart';
import 'package:plane_vite/screens/welcome/welcome_screen.dart';
import 'package:flutter/services.dart';
import 'package:plane_vite/skeleton/skeleton_screen.dart';
import 'package:plane_vite/storage/secure_storage.dart';
import 'package:plane_vite/test/test.dart';
import 'package:plane_vite/widgets/loader_screen.dart';
import 'config/theme_service.dart';
import 'config/themes.dart';
import 'constants.dart';
import 'screens/bindings/settings_binding.dart';
import 'translations.dart';


Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Get.put(MyDrawerController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.pink,
     darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
     // theme: ThemeData(fontFamily: 'HacenN', colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kMainPink.value)),
      debugShowCheckedModeBanner: false,
      translations:  Translation(),
      locale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      initialRoute: '/backlog',
      transitionDuration: const Duration(milliseconds: 500),
      getPages: [
        GetPage(name: '/splash', page: ()=>const SplashScreen(),binding: SplashBinding()),
        GetPage(name: '/skeleton', page: ()=> SkeletonScreen(),binding: SkeletonBinding()),
        GetPage(name: '/login', page: ()=>LoginScreen(),binding: LoginBinding()),
        GetPage(name: '/signup', page: ()=> SignupScreen(),binding: SignupBinding()),
        GetPage(name: '/welcome', page: ()=>const WelcomeScreen(),binding: WelcomeBinding()),
        GetPage(name: '/home', page: ()=>HomeScreen(),binding:HomeBinding()),
        GetPage(name: '/backlog', page: ()=> BackLogScreen(),binding:BackLogBinding()),
        GetPage(name: '/sprint', page: ()=>SprintScreen(),binding:SprintBinding()),
        GetPage(name: '/task', page: ()=>TaskScreen(),binding:TaskBinding()),
        GetPage(name: '/notifications', page: ()=>NotificationsScreen(),binding:NotificationsBinding()),
        GetPage(name: '/todo', page: ()=>ToDoScreen(),binding:ToDoBinding()),
        GetPage(name: '/drawer', page: ()=> DrawerScreen(),binding:DrawerBinding()),
        GetPage(name: '/test', page: ()=> LoaderScreen()),
        GetPage(name: '/settings', page: ()=>SettingsScreen(),binding:SettingsBinding()),
        GetPage(name: '/test2', page: ()=>Test(),binding:TestBinding()),
      ],
      builder: EasyLoading.init(),
    );

  }
}



