import 'package:flutter/material.dart';
import 'package:itravel/pages/main/home_page.dart';
import 'package:itravel/pages/state/navigation/app_link.dart';
import 'package:itravel/pages/welcome_page.dart';
import '../app_state_manager.dart';
import '../profile_manager.dart';
import 'itravel_pages.dart';

class AppRouter extends RouterDelegate<AppLink>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final AppStateManager appStateManager;
  final ProfileManager profileManager;

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouter({
    required this.appStateManager,
    required this.profileManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    profileManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (appStateManager.isInitialized) WelcomePage.page(),
        if (appStateManager.isOnboardingComplete)
          HomePage.page(appStateManager.getSelectedTab)
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    return true;
  }

// Helper function that converts the app state to an AppLink object
// When the user presses a button or modifies a state, notifyListeners() fires
// RouteInformationParser asks for the current navigation configuration, so you
// must convert your app state to an AppLink.
// RouteInformationParser then calls restoreRouteInformation and converts
// AppLink to a URL string.

  AppLink getCurrentPath() {
    if (!appStateManager.isOnboardingComplete) {
      return AppLink(location: ItravelPages.onboardingPath);
    }
    // else if (appStateManager.isOnboardingComplete) {
    //   return AppLink(location: ItravelPages.onboardingPath);
    // }
    else {
      return AppLink(
          location: ItravelPages.home,
          currentTab: appStateManager.getSelectedTab);
    }
  }

  // Apply configuration helper
  // Accessing currentConfiguration calls the helper, getCurrentPath(),
  // which checks the app state and returns the right app link configuration.
  @override
  AppLink get currentConfiguration => getCurrentPath();

  // logic that maps a specific URL path to a specific screen
  @override
  Future<void> setNewRoutePath(AppLink configuration) async {
    switch (configuration.location) {
      case ItravelPages.onboardingPath:
        if (!appStateManager.isOnboardingComplete) {
          appStateManager.resetOnboarding();
        } else {
          appStateManager.goToTab(configuration.currentTab ?? 0);
        }
        break;
      case ItravelPages.home:
        appStateManager.goToTab(configuration.currentTab ?? 0);
        break;
      default:
        break;
    }
  }
}
