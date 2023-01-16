import 'package:flutter/material.dart';
import 'package:task_helper/constants.dart';

class AddEntryForm extends StatefulWidget {
  const AddEntryForm({super.key});

  @override
  State<AddEntryForm> createState() => _AddEntryFormState();
}

class _AddEntryFormState extends State<AddEntryForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: 300,
      child: Form(
        key: _formKey,
        child: Column(children: [
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                  labelText: Strings.date, icon: Icon(Icons.date_range)),
              autofocus: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: Strings.name),
            ),
          ),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: Strings.unit),
            ),
          ),
        ]),
      ),
    );
  }
}
