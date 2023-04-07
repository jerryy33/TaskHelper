import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_helper/templates/templates.dart';

class TemplateRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('templates');

  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  Future<DocumentReference> addTemplate(Template template) {
    return collection.add(template.toJson());
  }

  void updateTemplate(Template template) async {
    await collection.doc('$template.id').update(template.toJson());
  }
  //
}
