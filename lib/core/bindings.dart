import 'package:gellary_app/controller/home_controller.dart';
import 'package:gellary_app/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings{
  @override
  void dependencies() {
     Get.put(() => LoginController());
  }
}class HomeBindings extends Bindings{
  @override
  void dependencies() {
     Get.put(() => HomeController());
  }
}