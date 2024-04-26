import 'package:gellary_app/model/models/user.dart';
import 'package:gellary_app/model/repositories/base_auth_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/app_url.dart';

class AuthDataSource extends GetConnect implements BaseAuthRepository {
  @override
  Future<void> logOut() async {
    GetStorage().remove('user');
  }

  @override
  Future<User> login(String email, String password) async {
    FormData form = FormData({
      'email': email,
      'password': password,
    });
    print(email);
    print(password);
    Response response = await post(AppUrl.login, form,
    );
    print(response.status.code);


    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> userData = response.body['user'];
      String token = response.body['token'];
      userData.addAll({
        'token': token,
      });
      print(userData);
      return User.fromJson(userData);
    } else {
      throw Exception("couldn't login");
    }
  }
}
