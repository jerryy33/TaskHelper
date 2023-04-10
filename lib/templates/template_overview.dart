import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_helper/constants/strings.dart';
import 'package:task_helper/templates/current_template.dart';
import 'package:task_helper/templates/template_repository%20.dart';
import 'package:task_helper/templates/templates.dart';

class TemplateOverview extends StatelessWidget {
  const TemplateOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Text(
            Strings.myTemplates,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: TemplateList(),
        ),
      ],
    );
  }
}

class TemplateList extends StatefulWidget {
  const TemplateList({super.key});

  @override
  State<TemplateList> createState() => _TemplateListState();
}

class _TemplateListState extends State<TemplateList> {
  final TemplateRepository templateRepository = TemplateRepository();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: templateRepository.getStream(),
      builder: (context, snapshot) {
        // TODO error handling
        if (!snapshot.hasData) return Text('failed');
        final templateList = snapshot.data?.docs
                .map((data) => Template.fromSnapshot(data))
                .toList() ??
            [];
        return buildList(context, templateList);
      },
    );
  }

  buildList(BuildContext context, List<Template> templates) {
    return ListView.separated(
      itemCount: templates.length,
      separatorBuilder: (context, index) => const Divider(thickness: 1),
      itemBuilder: (context, index) {
        return ListTile(
          trailing: const Icon(Icons.delete),
          title: Text(templates[index].name),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    CurrentTemplate(templateId: templates[index].id),
              ),
            );
          },
        );
      },
    );
  }
}
