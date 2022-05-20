import 'package:flutter/foundation.dart';
import 'itravel_pages.dart';

class AppLink {
  // constants for each of the query parameters
  static const String kTabParam = 'tab';

  // Store the url path
  String? location;

  // Use currentTab to store the tab you want to redirect the user to
  int? currentTab;

  // Initialize the app link with the location and query parameters.
  AppLink({
    this.location,
    this.currentTab,
  });

  // converts a URL string to an AppLink
  static AppLink fromLocation(String? location) {
    location = Uri.decodeFull(location ?? '');
    final uri = Uri.parse(location);
    final params = uri.queryParameters;
    final currentTab = int.tryParse(params[AppLink.kTabParam] ?? '');

    final link = AppLink(location: uri.path, currentTab: currentTab);
    return link;
  }

// converts AppLink back to a URI string
  String toLocation() {
    // 1
    String addKeyValPair({
      required String key,
      String? value,
    }) =>
        value == null ? '' : '$key=$value&';

    if (kDebugMode) {
      print(location);
    }
    
    switch (location) {
      case ItravelPages.onboardingPath:
        return ItravelPages.onboardingPath;

      default:
        var loc = '${ItravelPages.home}?';
        loc += addKeyValPair(
          key: kTabParam,
          value: currentTab.toString(),
        );
        return Uri.encodeFull(loc);
    }
  }
}
