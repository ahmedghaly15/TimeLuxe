import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/user_model.dart';
import '../domain/sign_up_view_repo.dart';

class SignUpViewRepoImpl extends SignUpViewRepo {
  @override
  Future<UserCredential> userSignUp({
    required String username,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> firestoreCreateUSer({
    String? name,
    String? email,
    String? uId,
  }) async {
    UserModel userModel = UserModel(
      name: name,
      email: email,
      uId: uId,
    );
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toJson());
  }
}
