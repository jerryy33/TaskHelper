import 'package:flutter/material.dart';

import '../constants/strings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: ListTile.divideTiles(
      context: context,
      tiles: [
        ListTile(
          title: const Text(Strings.about),
          onTap: () => print(''),
        ),
        ListTile(
          title: const Text(Strings.theme),
          onTap: () => print(''),
        ),
        ListTile(
          title: const Text(Strings.dataUsage),
          onTap: () => print(''),
        ),
        ListTile(
          title: const Text(Strings.deleteAccount),
          onTap: () => print(''),
        ),
      ],
    ).toList());
  }
}
