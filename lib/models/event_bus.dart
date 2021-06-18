import 'package:flutter/foundation.dart';

class EventBus with ChangeNotifier {
  bool _logout = false;
  bool get getStateLogout => _logout;
  void setStateLogout(bool logout) {
    _logout = logout;
    notifyListeners();
  }
}
