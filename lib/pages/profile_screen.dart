import 'package:akademi_yanimda/pages/auth_screen.dart';
import 'package:akademi_yanimda/utilities/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20) + EdgeInsets.only(top: 50),
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
              ProfileContainer(title: "Şifre", value: "********"),
              ProfileContainer(title: "E-posta", value: user.email!),
            ],
          ),
          MainButton(
              onTap: () async {
                await signOutWithGoogle();
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
