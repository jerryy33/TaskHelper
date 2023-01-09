import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const settingsTitle = 'Settings';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('About'),
          onTap: () => print(''),
        ),
        ListTile(
          title: Text('Theme'),
          onTap: () => print(''),
        ),
        ListTile(
          title: Text('Data Usage'),
          onTap: () => print(''),
        ),
        ListTile(
          title: Text('Delete Account'),
          onTap: () => print(''),
        ),
      ],
    );
  }
}
