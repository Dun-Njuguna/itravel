import 'package:flutter/material.dart';
import 'package:itravel/models/state/app_state_manager.dart';
import 'package:itravel/models/state/navigation/itravel_pages.dart';
import 'package:itravel/pages/main/discover_page.dart';
import 'package:itravel/pages/main/near_me_page.dart';
import 'package:itravel/pages/main/profile_page.dart';
import 'package:itravel/utils/constants.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static MaterialPage page(int currentTab) {
    return MaterialPage(
      name: ItravelPages.home,
      key: ValueKey(ItravelPages.home),
      child: HomePage(
        currentTab: currentTab,
      ),
    );
  }

  final int currentTab;

  const HomePage({
    Key? key,
    required this.currentTab,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<Widget> pages = <Widget>[
    const DiscoverPage(),
    const NearMePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(
      builder: (context, appStateManager, child) {
        return Scaffold(
          body: IndexedStack(index: widget.currentTab, children: pages),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
            currentIndex: widget.currentTab,
            onTap: (index) {
              Provider.of<AppStateManager>(context, listen: false)
                  .goToTab(index);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined),
                label: 'Discover',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_city_outlined),
                label: 'NearMe',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_outlined),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget profileButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
            welcomeImages.first,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
