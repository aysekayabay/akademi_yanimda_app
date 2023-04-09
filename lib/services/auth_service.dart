import 'package:akademi_yanimda/firebase/firestore_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class AuthService {
  String? uid;
  dynamic userData;
  static AuthService? _instance;
  static AuthService get instance {
    _instance ??= AuthService._init();
    return _instance!;
  }

  AuthService._init();

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    uid = null;
    userData = null;
  }

  Future<int> register({required BuildContext context, required String email, required String password, required String fullName, required String nickName}) async {
    try {
      UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      if (user.user != null) {
        await FirestoreManager().firestoreSendDataMap(
          collectionID: 'users',
          docID: user.user!.uid,
          data: {'email': email, 'userID': user.user!.uid, 'created': FieldValue.serverTimestamp(), 'point': 0, 'fullName': fullName, 'nickName': nickName, 'firstQuestion': 0},
        );
        return 1;
      } else {
        return 0;
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
      return -1;
    }
  }

  Future<int> login(BuildContext context, String email, String password) async {
    try {
      UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if (user != null) {
        uid = user.user!.uid;
        userData = await FirestoreManager().firestoreGetDocument(collectionID: "users", documentID: user.user!.uid);
        return 1;
      } else {
        return 0;
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        default:
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              e.message.toString(),
            ),
          ));
      }
      return -1;
    }
  }
}

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<void> signOutWithGoogle() async {
  await FirebaseAuth.instance.signOut();
  await GoogleSignIn().signOut();
}
