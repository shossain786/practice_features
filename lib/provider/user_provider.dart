import 'package:flutter/material.dart';
import 'package:practice_features/module/user_module.dart';

class UserProvider extends ChangeNotifier {
  User _user = User('Salim', 20);

  User get user => _user;

  void updateUser(String name, int age) {
    _user = User(name, age);
    notifyListeners();
  }
}
