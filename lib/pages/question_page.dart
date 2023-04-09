import 'package:akademi_yanimda/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../utilities/styles.dart';

class QuestionPage extends StatefulWidget {
  final ForumModel forum;
  const QuestionPage({super.key, required this.forum});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  TextEditingController controller = TextEditingController();
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
    super.initState();
    _fetchCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF6F8FD),
        appBar: AppBar(),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : StreamBuilder(
                stream: FirebaseFirestore.instance.collection('forum').doc('${widget.forum.docID}').collection('answers').orderBy('time').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final answerList = snapshot.data!.docs.reversed.toList();
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.forum.title, style: Styles.forumSenderTitleStyle.copyWith(fontSize: 24)),
                                QAitem(time: widget.forum.time, senderNickname: widget.forum.senderNickname, text: widget.forum.text),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(image: AssetImage("assets/images/message.png")),
                                    SizedBox(width: 5),
                                    Text(((answerList != null && answerList.length != 0) ? answerList.length.toString() : "0") + " Cevap"),
                                  ],
                                ),
                                widget.forum.answers != null
                                    ? Column(
                                        children: List.generate(3, (index) => Text("a")),
                                      )
                                    : SizedBox(),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                                  child: TextFormField(
                                    controller: controller,
                                    minLines: 5,
                                    maxLines: 5,
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
                                          .doc('${widget.forum.docID}')
                                          .collection('answers')
                                          .add({'text': controller.text, 'sender': currentUser!.nickName, 'time': DateTime.now()});
                                      controller.clear();

                                      int userPoint = currentUser!.point;
                                      FirebaseFirestore.instance.collection('users').doc(user.uid).set({'point': userPoint + 1}, SetOptions(merge: true));
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text("Soruyu cevapladığın için teşekkürler!")));
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
                                SizedBox(height: 10),
                                Divider()
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(answerList.length, (index) {
                              return Padding(
                                  padding: const EdgeInsets.all(18.0), child: QAitem(time: answerList[index]['time'], senderNickname: answerList[index]['sender'], text: answerList[index]['text']));
                            }),
                          ),
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

class QAitem extends StatelessWidget {
  final Timestamp time;
  final String senderNickname;
  final String text;

  const QAitem({super.key, required this.time, required this.senderNickname, required this.text});

  @override
  Widget build(BuildContext context) {
    DateTime Qtime = time.toDate();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("@" + senderNickname, style: Styles.forumSenderTitleStyle),
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0, top: 4),
          child: Text("Oyun ve Uygulama Akademisi Bursiyeri", style: Styles.forumSubheaderStyle),
        ),
        Text(Qtime.day.toString().padLeft(2, "0") + "." + Qtime.month.toString().padLeft(2, "0") + "." + Qtime.year.toString(), style: Styles.buttonTextStyle.copyWith(color: Styles.forumGrey)),
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Text(
              text,
              style: Styles.buttonTextStyle.copyWith(color: Styles.forumGrey, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
