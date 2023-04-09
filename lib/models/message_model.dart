import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String text;
  final String sender;
  final DateTime time;

  MessageModel(this.text, this.sender, this.time);
}

class ForumModel {
  final String docID;
  final String senderNickname;
  final String userID;
  final String title;
  final String text;
  final Timestamp time;
  final List<AnswerModel>? answers;

  ForumModel({
    required this.docID,
    required this.senderNickname,
    required this.userID,
    required this.title,
    required this.text,
    required this.time,
    this.answers,
  });
}

class AnswerModel {}
