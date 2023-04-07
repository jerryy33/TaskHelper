import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_helper/constants/strings.dart';
import 'package:task_helper/templates/templates.dart';

import '../home/add_entry_form.dart';
import '../statistics/statistics.dart';

class CurrentTemplate extends StatelessWidget {
  const CurrentTemplate({super.key});

  static var entries = <TemplateEntry>[
    TemplateEntry('User 1', 1000, DateTime.now()),
    TemplateEntry('User 2', 1000, DateTime.now()),
    TemplateEntry('User 1', 1000, DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(Strings.templateName,
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
                    child: const Text(Strings.statistics)),
              ],
            ),
          ),
          createDataTable(context),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
                child: const Text(Strings.add),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return AlertDialog(
                          title: const Text(Strings.addNewEntry),
                          clipBehavior: Clip.none,
                          scrollable: true,
                          content: AddEntryForm(formKey),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    print('saved');
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text(Strings.save))
                          ],
                        );
                      }));
                }),
          )
        ]),
      ),
    );
  }

  DataTable createDataTable(BuildContext context) {
    return DataTable(
        dataRowHeight: (MediaQuery.of(context).size.height - 56) / 6,
        headingRowHeight: 56,
        columns: createColumns(),
        rows: createRows());
  }

  List<DataColumn> createColumns() {
    return const [
      DataColumn(
        label: Expanded(
          child: Text(
            Strings.date,
            textAlign: TextAlign.center,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: Text(
            Strings.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: Text(
            Strings.unit,
            textAlign: TextAlign.center,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      )
    ];
  }

  List<DataRow> createRows() {
    return entries
        .map((entry) => DataRow(cells: [
              DataCell(Text(
                  DateFormat(Strings.simpleDateFormat).format(entry.date))),
              DataCell(Text(entry.userName.toString())),
              DataCell(Text(entry.unitAmount.toString()))
            ]))
        .toList();
  }
}
