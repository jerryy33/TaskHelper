import 'package:flutter/material.dart';
import 'package:task_helper/home/add_entry_form.dart';
import 'package:task_helper/settings/settings.dart';
import 'package:task_helper/statistics/statistics.dart';

import '../template_creation/create_template.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const navbarItemList = <NavBarItemCard>[
    NavBarItemCard(
      Icons.create,
      'Create Template',
    ),
    NavBarItemCard(
      Icons.home,
      'Home',
    ),
    NavBarItemCard(
      Icons.settings,
      'Settings',
    ),
  ];
  static const navbarItemLinkList = <Widget>[
    TemplateCreationScreen(),
    CurrentTemplate(),
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
          title: const Text('Task Helper',
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
                    'Share',
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

class CurrentTemplate extends StatelessWidget {
  const CurrentTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Template Name',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline)),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Statistics(),
                      ),
                    );
                  },
                  child: const Text('Statistics')),
            ],
          ),
        ),
        DataTable(
          dataRowHeight: (MediaQuery.of(context).size.height - 56) / 6,
          headingRowHeight: 56,
          columns: const <DataColumn>[
            DataColumn(
              label: Expanded(
                child: Text(
                  'Date',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Name',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Unit',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
          rows: const <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Sarah')),
                DataCell(Text('19')),
                DataCell(Text('Student')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Janine')),
                DataCell(Text('43')),
                DataCell(Text('Professor')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('William')),
                DataCell(Text('27')),
                DataCell(Text('Associate Professor')),
              ],
            ),
          ],
        ),
        const AddEntryForm()
      ]),
    );
  }
}

class NavBarItemCard {
  final IconData icon;
  final String label;
  const NavBarItemCard(this.icon, this.label);
}
