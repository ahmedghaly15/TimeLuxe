import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class SignUpViewRepo {
  Future<UserCredential> userSignUp({
    required String username,
    required String email,
    required String password,
    required BuildContext context,
  });

  Future<void> firestoreCreateUSer({
    String? name,
    String? email,
    String? uId,
  });

  Future<UserCredential> signInWithGoogle();
}
