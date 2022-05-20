import 'package:flutter/material.dart';
import 'package:itravel/app_theme.dart';
import 'package:provider/provider.dart';

import 'pages/state/app_state_manager.dart';
import 'pages/state/navigation/app_route_parser.dart';
import 'pages/state/navigation/app_router.dart';
import 'pages/state/profile_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //State managers
  final _appStateManager = AppStateManager();
  final _profileManager = ProfileManager();

  //AppRouter
  late AppRouter _appRouter;

    // Initialize RouteInformationParser
  final routeParser = AppRouteParser();

  @override
  void initState() {
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
      profileManager: _profileManager,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _profileManager,
        ),
      ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
          ThemeData appTheme;
          if (profileManager.darkMode) {
            appTheme = AppTheme.dark();
          } else {
            appTheme = AppTheme.light();
          }
          return MaterialApp.router(
            theme: appTheme,
            title: 'iTravel',
            backButtonDispatcher: RootBackButtonDispatcher(),
            routeInformationParser: routeParser,
            routerDelegate: _appRouter,
          );

          // return MaterialApp(
          //   title: 'iTravel',
          //   theme: appTheme,
          //   home: Router(
          //     routerDelegate: _appRouter,
          //     backButtonDispatcher: RootBackButtonDispatcher(),
          //   ),
          // );
          
        },
      ),
    );
  }
}
