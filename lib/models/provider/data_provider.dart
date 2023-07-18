import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../user_model.dart';

class DataProvider extends ChangeNotifier {
  Stream<UserModel?>? get user {
    return FirebaseAuth.instance.currentUser?.uid == null
        ? null
        : FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots()
            .map((event) =>
                event.exists ? UserModel.fromJson(event.data()!) : null);
  }
}
