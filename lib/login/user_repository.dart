import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_helper/login/user.dart';
import 'package:task_helper/templates/templates.dart';

class UserRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('users');

  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  Future<DocumentReference> addUser(User user) {
    return collection.add(user.toJson());
  }

  Future<QuerySnapshot> findUser(String userName, String pw) {
    return collection
        .where("userName", isEqualTo: userName)
        .where("pw", isEqualTo: pw)
        .snapshots()
        .first;
  }
}
