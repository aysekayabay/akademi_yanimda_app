import 'package:akademi_yanimda/models/user_model.dart';
import 'package:akademi_yanimda/pages/auth_screen.dart';
import 'package:akademi_yanimda/utilities/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isGoogle = false;
  UserModel? currentUser;
  bool isLoading = true;
  _fetchCurrentUser() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).get().then((value) {
        setState(() {
          currentUser = UserModel(value['fullName'], value['nickName'], value['email'], value['point'], value['userID'], value['firstQuestion']);
          isGoogle = value['google'];
          isLoading = false;
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20) + EdgeInsets.only(top: 50),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Text(
                        user.displayName!.substring(0, 1),
                        style: Styles.buttonTextStyle,
                      ),
                      backgroundColor: Styles.buttonColor,
                    ),
                    SizedBox(height: 50),
                    ProfileContainer(title: "Ad Soyad", value: user.displayName!),
                    ProfileContainer(title: "Kullanıcı Adı", value: currentUser?.nickName ?? ''),
                    ProfileContainer(title: "Şifre", value: "********"),
                    ProfileContainer(title: "E-posta", value: user.email!),
                  ],
                ),
                MainButton(
                    onTap: () async {
                      if (isGoogle == true) {
                        await signOutWithGoogle();
                      } else {
                        await FirebaseAuth.instance.signOut();
                      }
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) {
                          return AuthScreen();
                        },
                      ));
                    },
                    isFilled: true,
                    title: "Çıkış Yap"),
              ],
            ),
          );
  }
}

class ProfileContainer extends StatelessWidget {
  final String title;
  final String value;
  const ProfileContainer({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Styles.hintStyle),
          SizedBox(height: 5),
          Text(value, style: Styles.classicTextStyle),
          Divider(height: 20),
        ],
      ),
    );
  }
}
