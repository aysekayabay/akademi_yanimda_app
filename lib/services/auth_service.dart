import 'package:akademi_yanimda/firebase/firestore_manager.dart';
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

  Future<int> register(BuildContext context, String email, String password) async {
    try {
      UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      if (user.user != null) {
        await FirestoreManager().firestoreSendDataMap(
          collectionID: 'user',
          docID: user.user!.uid,
          data: {'email': email, 'userID': user.user!.uid, 'created': DateTime.now()},
        );
        uid = user.user!.uid;
        // userData = await FirestoreManager().firestoreGetDocument(collectionID: "user", documentID: user.user!.uid);
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
        // userData = await FirestoreManager().firestoreGetDocument(collectionID: "user", documentID: user.user!.uid);
        return 1;
      } else {
        return 0;
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        // case Languagekeys.loginExecptionCaseNotUser:
        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //       content: Text(
        //         Languagekeys.loginExecptionReturnNotUser,
        //         style: TextStyleUtility.loginMain,
        //       ),
        //       backgroundColor: ColorUtility.brand));
        //   break;
        // case Languagekeys.loginExecptionCaseWrongPassword:
        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //       content: Text(
        //         Languagekeys.loginExecptionReturnWrongPassword,
        //         style: TextStyleUtility.loginMain,
        //       ),
        //       backgroundColor: ColorUtility.brand));
        //   break;
        // case Languagekeys.loginExecptionCaseUnknown:
        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //       content: Text(
        //         Languagekeys.loginExecptionReturnUnkown,
        //         style: TextStyleUtility.loginMain,
        //       ),
        //       backgroundColor: ColorUtility.brand));
        //   break;
        // case Languagekeys.loginExecptionCaseInvalidEmail:
        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //       content: Text(
        //         Languagekeys.loginExecptionReturnInvalidEmail,
        //         style: TextStyleUtility.loginMain,
        //       ),
        //       backgroundColor: ColorUtility.brand));
        // break;
        default:
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              e.message.toString(),
              // style: TextStyleUtility.loginMain,
            ),
            // backgroundColor: ColorUtility.brand,
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
