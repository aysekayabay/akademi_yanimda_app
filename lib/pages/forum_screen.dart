import 'package:akademi_yanimda/models/message_model.dart';
import 'package:akademi_yanimda/pages/add_forum.dart';
import 'package:akademi_yanimda/pages/question_page.dart';
import 'package:akademi_yanimda/utilities/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF6F8FD),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: FloatingActionButton(
            backgroundColor: Styles.darkPurp,
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return AddForumScreen();
                },
              ));
            },
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('forum').orderBy('time').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final forumList = snapshot.data!.docs.reversed.toList();
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          forumList.length,
                          (index) => ForumItem(
                            forum: ForumModel(
                                docID: forumList[index]['docID'],
                                senderNickname: forumList[index]['sender'],
                                userID: forumList[index]['userID'],
                                title: forumList[index]['title'],
                                text: forumList[index]['text'],
                                time: forumList[index]['time']),
                          ),
                        )),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

class ForumItem extends StatelessWidget {
  const ForumItem({
    super.key,
    required this.forum,
  });

  final ForumModel forum;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return QuestionPage(forum: forum);
          },
        )),
        child: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width - 20,
          decoration: BoxDecoration(boxShadow: [Styles.normalShadow], color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(forum.title, style: Styles.rankHeaderStyle.copyWith(color: Colors.black)),
              Text('@' + forum.senderNickname, style: Styles.forumSenderTitleStyle),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0, top: 4),
                child: Text("Oyun ve Uygulama Akademisi Bursiyeri", style: Styles.forumSubheaderStyle),
              ),
              Text(forum.time.toDate().day.toString().padLeft(2, "0") + "." + forum.time.toDate().month.toString().padLeft(2, "0") + "." + forum.time.toDate().year.toString(),
                  style: Styles.forumSubheaderStyle.copyWith(fontSize: 18)),
              SizedBox(height: 20),
              Text(
                forum.text,
                style: Styles.buttonTextStyle.copyWith(color: Styles.forumGrey, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
