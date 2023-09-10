import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';

import 'package:image_picker/image_picker.dart';

import '../../core/models/user_model.dart';
import '../../core/utils/helper.dart';
import '../domain/time_luxe_repo.dart';

class TimeLuxeRepoImpl extends TimeLuxeRepo {
  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(
    String? uId,
  ) async {
    return await FirebaseFirestore.instance.collection('users').doc(uId).get();
  }

  @override
  Future<void> updateUser({required UserModel userModel}) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(Helper.model!.uId)
        .update(userModel.toJson());
  }

  @override
  Future<XFile?> getProfileImage({required ImageSource source}) async {
    return await ImagePicker().pickImage(source: source);
  }

  @override
  Future<TaskSnapshot> uploadProfileImage({
    File? profileImage,
  }) async {
    return await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage);
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
