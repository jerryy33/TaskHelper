import 'package:flutter/material.dart';
import 'package:task_helper/constants/strings.dart';
import 'package:task_helper/settings/settings.dart';
import 'package:task_helper/templates/template_overview.dart';
import '../template_creation/create_template.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const navbarItemList = <NavBarItemCard>[
    NavBarItemCard(
      Icons.create,
      Strings.templateCreation,
    ),
    NavBarItemCard(
      Icons.home,
      Strings.home,
    ),
    NavBarItemCard(
      Icons.settings,
      Strings.settings,
    ),
  ];
  static const navbarItemLinkList = <Widget>[
    TemplateCreationScreen(),
    TemplateOverview(),
    SettingsScreen()
  ];

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(Strings.taskHelper,
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'serif'),
              maxLines: 1,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis),
          actions: [
            if (_selectedIndex == 1)
              TextButton(
                  onPressed: (() => print('share')),
                  child: const Text(
                    Strings.share,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontFamily: 'serif',
                        fontStyle: FontStyle.italic),
                  ))
          ],
        ),
        body: IndexedStack(
            index: _selectedIndex, children: Home.navbarItemLinkList),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.lightBlue,
            unselectedItemColor: Colors.grey,
            onTap: (index) => setState(() {
                  _selectedIndex = index;
                }),
            items: Home.navbarItemList
                .map((NavBarItemCard navBarItemCard) => BottomNavigationBarItem(
                    icon: Icon(navBarItemCard.icon),
                    label: navBarItemCard.label))
                .toList()),
      ),
    );
  }
}

class NavBarItemCard {
  final IconData icon;
  final String label;
  const NavBarItemCard(this.icon, this.label);
}
