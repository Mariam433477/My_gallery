import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:gellary_app/view/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppMiddleware extends GetMiddleware{
  @override
  int? priority=1;
  @override
  RouteSettings? redirect(String? route) {
  final user=GetStorage().read('user');
  if(user!=null){
    return const RouteSettings(name: HomeScreen.name);
  }
  return null;
  }


}
// Define the middleware function
bool checkAuthMiddleware(Routing routing) {
  // Check if the user is logged in
  bool isLoggedIn = GetStorage().read('user')!=null;

  // Determine the destination screen based on the login status
  String destinationScreen = isLoggedIn ? '/' : '/login';

  // Update the routing destination
  routing.current = destinationScreen;

  // Return true to continue with the route change
  return true;
}