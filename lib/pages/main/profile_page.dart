import 'package:flutter/material.dart';
import 'package:itravel/pages/state/navigation/itravel_pages.dart';
import 'package:itravel/pages/state/profile_manager.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {

  static MaterialPage page(r) {
    return MaterialPage(
      name: ItravelPages.profilePath,
      key: ValueKey(ItravelPages.profilePath),
      child: const ProfilePage(),
    );
  }

  const ProfilePage({ Key? key,}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            Expanded(
              child: buildMenu(),
            )
          ],
        ),
      ),
    );
  }

    Widget buildMenu() {
    return ListView(
      children: [
        darkModeToggel(),
      ],
    );
  }

  Widget darkModeToggel() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Dark Mode'),
          Switch(
            value: Provider.of<ProfileManager>(context, listen: true).getUser.setDarkMode,
            onChanged: (value) {
              Provider.of<ProfileManager>(context, listen: false).darkMode =
                  value;
            },
          )
        ],
      ),
    );
  }

}

