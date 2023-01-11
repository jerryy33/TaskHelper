import 'package:flutter/material.dart';

import '../home/add_entry_form.dart';
import '../statistics/statistics.dart';

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
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ElevatedButton(
              child: const Text('Add'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                        title: const Text('Add new entry'),
                        clipBehavior: Clip.none,
                        scrollable: true,
                        content: const AddEntryForm(),
                        actions: [
                          ElevatedButton(
                              onPressed: (() => print('add')),
                              child: const Text('Save'))
                        ],
                      );
                    }));
              }),
        )
      ]),
    );
  }
}
