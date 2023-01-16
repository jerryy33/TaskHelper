import 'package:flutter/material.dart';
import 'package:task_helper/constants.dart';

import '../home/home.dart';

class TemplateCreationScreen extends StatefulWidget {
  const TemplateCreationScreen({super.key});

  @override
  State<TemplateCreationScreen> createState() => _TemplateCreationScreenState();
}

enum TrackableUnits { kilometer }

class _TemplateCreationScreenState extends State<TemplateCreationScreen> {
  bool _datesIncluded = false;
  TrackableUnits? _unit = TrackableUnits.kilometer;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Text(
                    Strings.newTemplate,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                )
              ],
            ),
            Row(
              children: const [
                Expanded(
                  child: TextField(
                      autofocus: true,
                      maxLength: 100,
                      decoration:
                          InputDecoration(labelText: Strings.templateName)),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  Strings.unitToTrack,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Spacer(),
                Expanded(
                  child: RadioListTile<TrackableUnits>(
                    contentPadding: const EdgeInsets.all(0),
                    title: const Text(Strings.kilometer),
                    value: TrackableUnits.kilometer,
                    groupValue: _unit,
                    onChanged: (TrackableUnits? value) {
                      setState(() {
                        _unit = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SwitchListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: const Text(Strings.dates),
                      isThreeLine: true,
                      subtitle: const Text(Strings.dateInfotext),
                      value: _datesIncluded,
                      onChanged: (bool value) {
                        setState(() {
                          _datesIncluded = value;
                        });
                      },
                      secondary: const Icon(Icons.date_range),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                      child: const Text(Strings.templateCreation)),
                ),
              ],
            )
          ],
        ));
  }
}
