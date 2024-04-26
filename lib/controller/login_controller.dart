import 'package:flutter/cupertino.dart';
import 'package:gellary_app/model/data_sources/auth_data_source.dart';
import 'package:gellary_app/model/models/user.dart';
import 'package:gellary_app/model/repositories/base_auth_repository.dart';
import 'package:gellary_app/view/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final BaseAuthRepository authRepository=AuthDataSource();
  bool isLoading=false;
  void login ()async{
    if(isLoading){
      return;
    }
    isLoading=true;
    update();
    try {
      final User user=await authRepository.login(emailController.text.trim(), passwordController.text.trim());
      GetStorage().write('user', user.toJson());
      Get.offNamed(HomeScreen.name);
    } on Exception catch (e) {
Get.rawSnackbar(title: e.toString(),message:e.toString());
isLoading=false;
update();
    }
    isLoading=false;
    update();
  }
}