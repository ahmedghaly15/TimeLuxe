import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/models/user_model.dart';

abstract class TimeLuxeRepo {
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String? uId);

  Future<void> updateUser({required UserModel userModel});

  Future<XFile?> getProfileImage({required ImageSource source});

  Future<TaskSnapshot> uploadProfileImage({File? profileImage});

  Future<void> signOut();
}
