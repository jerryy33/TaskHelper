import 'package:flutter/material.dart';
import 'package:task_helper/settings/settings.dart';

import '../template_creation/create_template.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      home: Scaffold(
        backgroundColor: Colors.cyanAccent,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Template Name',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'serif'),
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis),
          actions: <Widget>[
            TextButton(
                onPressed: (() => print('share')),
                child: const Text(
                  'Share',
                  style: TextStyle(
                      color: Colors.black, fontStyle: FontStyle.italic),
                ))
          ],
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 200),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(),
                children: const [
                  TableRow(children: [
                    TableCell(
                      //verticalAlignment: TableCellVerticalAlignment.fill,
                      child: SizedBox(
                          height: 50,
                          child:
                              Text('Date', style: TextStyle(fontSize: 20.0))),
                    ),
                    TableCell(
                        child: Text('Name', style: TextStyle(fontSize: 20.0))),
                    TableCell(
                        child: Text('Kilometer',
                            style: TextStyle(fontSize: 20.0))),
                  ]),
                  TableRow(children: [
                    TableCell(child: Text('Javatpoint')),
                    TableCell(child: Text('Flutter')),
                    TableCell(child: Text('5*')),
                  ]),
                  TableRow(children: [
                    TableCell(child: Text('Javatpoint')),
                    TableCell(child: Text('MySQL')),
                    TableCell(child: Text('5*')),
                  ]),
                  TableRow(children: [
                    TableCell(child: Text('Javatpoint')),
                    TableCell(child: Text('ReactJS')),
                    TableCell(child: Text('5*')),
                  ]),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: const HomeStatefull(),
      ),
    );
  }
}

class HomeStatefull extends StatefulWidget {
  const HomeStatefull({super.key});

  @override
  State<HomeStatefull> createState() => _HomeStatefullState();
}

class _HomeStatefullState extends State<HomeStatefull> {
    static const List<Widget> pageList = [
    TemplateCreationScreen(),
    Home(),
    SettingsScreen(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.lightBlue,
      unselectedItemColor: Colors.grey,
      onTap: (index) => setState(() {
        _selectedIndex = index;
        pageList.elementAt(_selectedIndex)
      }),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.create),
          label: 'Create Template',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
