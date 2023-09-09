import 'package:cloud_firestore/cloud_firestore.dart';

abstract class TimeLuxeRepo {
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String? uId);

  Future<void> signOut();
}
