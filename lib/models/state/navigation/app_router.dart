import 'package:flutter/material.dart';
import 'package:itravel/pages/main/home_page.dart';
import 'package:itravel/pages/welcome_page.dart';
import '../app_state_manager.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final AppStateManager appStateManager;

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouter({
    required this.appStateManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (appStateManager.isInitialized) WelcomePage.page(),
        if(appStateManager.isOnboardingComplete) HomePage.page(appStateManager.getSelectedTab)
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
