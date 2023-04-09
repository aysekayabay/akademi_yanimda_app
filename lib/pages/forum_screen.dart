import 'package:akademi_yanimda/models/message_model.dart';
import 'package:akademi_yanimda/pages/question_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance.collection('forum').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final forumList = snapshot.data!.docs.toList();
          return Column(
            children: [
              SizedBox(height: 300),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      forumList.length,
                      (index) => Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: ForumItem(
                              forum: ForumModel(
                                  docID: forumList[index]['docID'],
                                  senderNickname: forumList[index]['sender'],
                                  userID: forumList[index]['userID'],
                                  title: forumList[index]['title'],
                                  text: forumList[index]['text'],
                                  time: forumList[index]['time']),
                            ),
                          ))),
            ],
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
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return QuestionPage(forum: forum);
        },
      )),
      child: Container(
        child: Column(
          children: [
            Text(forum.senderNickname),
            Text(forum.title),
          ],
        ),
      ),
    );
  }
}
