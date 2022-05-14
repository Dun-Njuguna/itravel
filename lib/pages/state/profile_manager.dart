import 'package:flutter/material.dart';
import 'package:itravel/models/user.dart';

class ProfileManager extends ChangeNotifier {
  User get getUser => User(
        setDarkMode: _setDarkMode,
      );

  var _profileClicked = false;
  var _setDarkMode = false;

  bool get profileClicked => _profileClicked;
  bool get darkMode => _setDarkMode;

  set darkMode(bool darkMode) {
    _setDarkMode = darkMode;
    notifyListeners();
  }

  void tapOnProfile(bool selected) {
    _profileClicked = selected;
    notifyListeners();
  }
}
