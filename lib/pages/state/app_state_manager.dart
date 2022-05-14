import 'dart:async';
import 'package:flutter/material.dart';

class ITravelTabs {
  static const int home = 0;
  static const int nearMe = 1;
  static const int discover = 2;
  static const int profile = 3;
}

class AppStateManager extends ChangeNotifier {
  
  bool _initialized = true;
  
  bool _onboardingComplete = false;
  
  int _selectedTab = ITravelTabs.home;

  bool get isInitialized => _initialized;
  bool get isOnboardingComplete => _onboardingComplete;
  int get getSelectedTab => _selectedTab;

  void completeOnboarding() {
    _onboardingComplete = true;
    notifyListeners();
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

   void logout() {
    _onboardingComplete = false;
    _initialized = false;
    _selectedTab = 0;

    notifyListeners();
  }


}