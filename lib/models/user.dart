// import 'package:states_rebuilder/states_rebuilder.dart';
// me?fields=email,id,name

import 'package:flutter/foundation.dart';
import 'package:shoplive_mvp/mockup/db_json_read_file.dart';

class User with ChangeNotifier {
  Map<String, dynamic> _data;
  String _token;
}

extension UserX on User {
  void setUserData(Map<String, dynamic> jsonData) {
    this._data = jsonData;
    notifyListeners();
  }

  void setToken(String token) {
    this._token = token;
    notifyListeners();
  }

  Map<String, dynamic> get getUserData => this._data;
  String get getToken => this._token;
}
