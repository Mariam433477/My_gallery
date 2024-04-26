import 'dart:io';

import 'package:gellary_app/core/app_url.dart';
import 'package:gellary_app/model/repositories/base_auth_repository.dart';
import 'package:gellary_app/model/repositories/base_home_repository.dart';
import 'package:get/get.dart';

class HomeDataSource extends GetConnect implements BaseHomeRepository{
  @override
  Future<List<String>> getImages(String token) async {
  Response response =await get(AppUrl.myGallery,headers: {
    'Authorization':'Bearer $token','Content-Type':'application/json',
  });
  print(response.statusCode);
  if(response.statusCode==200 || response.statusCode==201){

    List<String> images=response.body['data']['images'];
    return images;

  }
  else {
    throw Exception("something went wrong");
  }
  }

  @override
  Future<void> uploadImage(File img) async {

    FormData from =FormData({
      'img':MultipartFile(img, filename:DateTime.now().millisecondsSinceEpoch.toString())
    });
Response response=await post(AppUrl.upload,from);
    if(response.statusCode!=200 && response.statusCode!=201){
      throw Exception("couldn't upload image ");
    }
  }

}