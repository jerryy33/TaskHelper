import 'package:flutter/material.dart';
import 'package:task_helper/constants/strings.dart';
import 'package:task_helper/templates/current_template.dart';
import 'package:task_helper/templates/templates.dart';

class TemplateOverview extends StatelessWidget {
  const TemplateOverview({super.key});

  static const templates = <Template>[
    Template('name', 'km', 1, 1, 33),
    Template('My template 1', 'miles', 1, 1, 23),
    Template('Long Name xueiieudsiudud', 'dollar', 1, 3, 2)
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Text(
            Strings.myTemplates,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListTile(
                trailing: const Icon(Icons.delete),
                title: Text(templates[index].name),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CurrentTemplate(),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
