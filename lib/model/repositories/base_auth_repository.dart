import 'package:flutter/material.dart';

import '../models/user.dart';

abstract class BaseAuthRepository {
  Future<User> login(String email, String password);
  Future<void> logOut();
}
