import 'package:flutter/material.dart';
import 'package:task_helper/constants/strings.dart';
import 'package:task_helper/validator_builder.dart';

class AddEntryForm extends StatefulWidget {
  final GlobalKey formKey;
  const AddEntryForm(this.formKey, {super.key});

  @override
  State<AddEntryForm> createState() => _AddEntryFormState();
}

class _AddEntryFormState extends State<AddEntryForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: 300,
      child: Form(
        key: widget.formKey,
        child: Column(children: [
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                  labelText: Strings.date, icon: Icon(Icons.date_range)),
            ),
          ),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: Strings.name),
              validator: ValidationBuilder()
                  .isEmpty(validationText: 'Name cannot be empty')
                  .build(),
            ),
          ),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: Strings.unit),
              validator: ValidationBuilder()
                  .isEmpty(validationText: 'Unit cannot be empty')
                  .isNumber()
                  .build(),
            ),
          ),
        ]),
      ),
    );
  }
}
