import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../utilities/styles.dart';

class AddForumScreen extends StatefulWidget {
  const AddForumScreen({super.key});

  @override
  State<AddForumScreen> createState() => _AddForumScreenState();
}

class _AddForumScreenState extends State<AddForumScreen> {
  TextEditingController textController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  UserModel? currentUser;
  bool isLoading = true;
  _fetchCurrentUser() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).get().then((value) {
        setState(() {
          currentUser = UserModel(value['fullName'], value['nickName'], value['email'], value['point'], value['userID'], value['firstQuestion']);
          isLoading = false;
        });
      });
    }
  }

  @override
  void initState() {
    _fetchCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F8FD),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0, right: 8),
                            child: InkWell(onTap: () => Navigator.of(context).pop(), child: Icon(Icons.arrow_back_outlined, color: Styles.darkPurp)),
                          ),
                          Text("Soru Gönder", style: Styles.rankHeaderStyle.copyWith(color: Color(0xff2447F9), fontSize: 22)),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextFormField(
                        controller: titleController,
                        minLines: 2,
                        maxLines: 2,
                        decoration: InputDecoration(fillColor: Colors.red, hintText: "Konu", border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextFormField(
                        controller: textController,
                        minLines: 6,
                        maxLines: 6,
                        decoration: InputDecoration(fillColor: Colors.red, hintText: "Yazmaya başla...", border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () async {
                          User user = FirebaseAuth.instance.currentUser!;
                          await FirebaseFirestore.instance
                              .collection('forum')
                              .doc(user.uid)
                              .set({'text': textController.text, 'title': titleController.text, 'userID': user.uid, 'docID': user.uid, 'sender': currentUser!.nickName, 'time': DateTime.now()});

                          titleController.clear();
                          textController.clear();

                          int userPoint = currentUser!.point;
                          FirebaseFirestore.instance.collection('users').doc(user.uid).set({'point': userPoint + 1}, SetOptions(merge: true));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text("Sorduğun soru toplulukla başarıyla paylaşıldı!")));
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                            decoration: ShapeDecoration(color: Color(0xff2447F9), shape: StadiumBorder()),
                            child: Text(
                              "Gönder",
                              style: Styles.rankingTextStyle.copyWith(fontSize: 16),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
