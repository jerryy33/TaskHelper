class Template {
  final String name;
  final num unit;
  final num id;
  // For now sharing a template is only possible between two users
  final num userOneId;
  final num userTwoId;

  Template(this.name, this.unit, this.id, this.userOneId, this.userTwoId);
}

class TemplateEntry {
  final num userId;
  final num unitAmount;
  final DateTime date;

  // Maybe necassary if TemplateEntry not a sub collection of Template
  //final num templateId;

  TemplateEntry(this.userId, this.unitAmount, this.date);
}
