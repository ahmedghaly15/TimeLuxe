import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  @override
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
