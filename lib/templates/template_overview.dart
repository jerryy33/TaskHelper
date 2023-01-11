import 'package:flutter/material.dart';
import 'package:task_helper/templates/current_template.dart';

class TemplateOverview extends StatelessWidget {
  const TemplateOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Text(
            'My templates',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              ListTile(
                trailing: const Icon(Icons.delete),
                title: const Text('My Template 1'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CurrentTemplate(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
