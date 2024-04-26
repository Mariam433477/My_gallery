
import 'dart:io';

import 'package:gellary_app/model/data_sources/auth_data_source.dart';
import 'package:gellary_app/model/data_sources/home_data_source.dart';
import 'package:gellary_app/model/repositories/base_auth_repository.dart';
import 'package:gellary_app/model/repositories/base_home_repository.dart';
import 'package:gellary_app/view/screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../model/models/user.dart';

class HomeController extends GetxController{
final BaseAuthRepository baseAuthRepository=AuthDataSource();
final BaseHomeRepository baseHomeRepository=HomeDataSource();
bool isLoading =false;
List<String> images=[];
String error ='';
late final User user;
@override

  void onInit() {
  user=User.fromJson(GetStorage().read('user'));
 getImages();

 super.onInit();
  }
void getImages() async{
  if(isLoading) {
    return;
  }
    isLoading = true;
  error='';
    update();
    try {
      final user =GetStorage().read('user');
      final String token =User.fromJson(user).token;
       List<String> imgs=await baseHomeRepository.getImages("eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNGE2MGVkODM5MjlmMDAzNzIwN2E5OGQ4OGQ3ODZmMWEzMGE4YWMxNjEyZGRjZTBkZmZkY2M4ZjZiNzI2NThiNTlkNzJhNTFlNGJlYjlhYWYiLCJpYXQiOjE2NjcwMzk0NDIuOTEyODUyLCJuYmYiOjE2NjcwMzk0NDIuOTEyODU3LCJleHAiOjE2OTg1NzU0NDIuODA0NjQ0LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.XIv-rCYm93m_kH-D2bmbJQ72qBsknAzM_9R1gw7wIt0GJQM_sktQa2n5REbHT590MgZmAZaCRenlyv1E1hswyatJa2_l4ev0r7ZJYmNdnhIvWrPuWxu_tG6htwU8HY24EfegFVzstcPdRbMAfAbkDiVvk1szCcyTvxQJ2BxXnZBJc_eM6wc_ugf9Lw9x23clYeNgcbEDh4skQ1gnl9vg0p5RCN5pjGvuLNyjOXJl2cB_2W4u20YWy1gaFTipghzTQ86yJwpLz_mC286v4p1jIYmJeUrrJId8pFjsDbxyNJnR7QPjXKS693bxyF6Xb4Zn23hcFVjTasac1R5DhxJSH7dbKqyuGsyiqSDu5mRZItHCDhgYWE7cmGEbXMvpSwHCVqOKUOGaz2LvlZdBMk7qkPzD8QpJ49tWLw4c3zLkxzqgZPyjHVkCCCi3FSFRwpuXEuI5aNRj-XF53VV2fi1n2AOECI_UmWUkAsSIuvA7uDmaI4U9hSvUvn7ynFAvCYuwtANMuZFqw-n4VaKOfIIhP0hSqdC3MeYcXXgAnOcsdUjOb5P28pCU6m76CP1hJlvqGZdDVJoCVOEwdQZ8AsZogjE3KGmscvGjTfcev32FhFGzyYiQjljCiwbm5OV5eH0LNWjHQD4exNP837vAtJpDWvVzoDmefnNQHlg74YMEBAY");
       images.addAll(imgs);
    } on Exception catch (e) {
       error=e.toString();
       isLoading=false;
       update();
    }
    isLoading=false;
    update();
}
void uploadImage(ImageSource imageSource) async{
  XFile? file=await ImagePicker().pickImage(source: imageSource);
  if(file==null){
    return;
  }
  try {
    File image =File(file.path);
    await baseHomeRepository.uploadImage(image);
  } on Exception catch (e) {
    Get.rawSnackbar(title: e.toString());
  }
}
void logOut()async{
  await baseAuthRepository.logOut();
  Get.offAllNamed(LoginScreen.name);
}

}