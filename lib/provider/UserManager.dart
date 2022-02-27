import 'package:coop_player/model/user.dart';
import 'package:flutter/cupertino.dart';

class UserManager extends ChangeNotifier {
  User? user;

  void provideLogin(User? user) {
    if (user == null) return;
    this.user = user;
    notifyListeners();
  }

  void provideLoggout() {
    user = null;
    notifyListeners();
  }
}
