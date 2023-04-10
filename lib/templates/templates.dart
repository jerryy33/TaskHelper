import 'package:cloud_firestore/cloud_firestore.dart';

class Template {
  final String name;
  final String unit;
  final num id;
  // For now sharing a template is only possible between two users
  final num userOneId;
  final num userTwoId;

  const Template(this.name, this.unit, this.id, this.userOneId, this.userTwoId);

  factory Template.fromJson(Map<String, dynamic> json) => Template(
      json['name'] as String,
      json['unit'] as String,
      json['id'] as num,
      json['userOneId'] as num,
      json['userTwoId'] as num);

  factory Template.fromSnapshot(DocumentSnapshot snapshot) =>
      Template.fromJson(snapshot.data() as Map<String, dynamic>);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'unit': unit,
        'userOneId': userOneId,
        'userTwoId': userTwoId
      };
}

class TemplateEntry {
  final String userName;
  final num unitAmount;
  final DateTime date;

  // Maybe necassary if TemplateEntry not a sub collection of Template
  //final num templateId;

  TemplateEntry(this.userName, this.unitAmount, this.date);

  factory TemplateEntry.fromJson(Map<String, dynamic> json) => TemplateEntry(
      json['userName'] as String,
      json['unitAmount'] as num,
      DateTime.parse(json['date']));

  factory TemplateEntry.fromSnapshot(DocumentSnapshot snapshot) =>
      TemplateEntry.fromJson(snapshot.data() as Map<String, dynamic>);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userName': userName,
        'unitAmount': unitAmount,
        'date': date
      };
}
