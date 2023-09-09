import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../domain/time_luxe_repo.dart';

class TimeLuxeRepoImpl extends TimeLuxeRepo {
  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(
    String? uId,
  ) async {
    return await FirebaseFirestore.instance.collection('users').doc(uId).get();
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
