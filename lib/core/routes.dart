import 'package:gellary_app/core/bindings.dart';
import 'package:gellary_app/view/screens/home_screen.dart';
import 'package:gellary_app/view/screens/login_screen.dart';
import 'package:get/get.dart';

import 'middleware/app_middleware.dart';

class Routes {
  static const String initialRoute=HomeScreen.name;
  static List<GetPage> pages=[
    GetPage(name: LoginScreen.name,binding:LoginBindings() , page: ()=> const LoginScreen()),
    GetPage(name: HomeScreen.name,binding: HomeBindings(), page: ()=> const HomeScreen()),

  ];

}