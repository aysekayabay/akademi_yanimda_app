import 'package:akademi_yanimda/utilities/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/message_model.dart';
import '../models/user_model.dart';
import 'messages_repo.dart';

class MessagesPage extends ConsumerStatefulWidget {
  const MessagesPage({super.key});

  @override
  ConsumerState<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends ConsumerState<MessagesPage> {
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
    Future.delayed(Duration.zero).then((value) => ref.read(NewMessageCountProvider.notifier).reset());
    _fetchCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final messagesRepo = ref.watch(messagesProvider);
    return Scaffold(
        appBar: AppBar(title: Text("Mesajlar")),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  reverse: true,
                  itemCount: messagesRepo.messages.length,
                  itemBuilder: (context, index) {
                    // bool itsMe = Random().nextBool();
                    return MessageView(messagesRepo.messages[messagesRepo.messages.length - index - 1]);
                  }),
            ),
            DecoratedBox(
              decoration: BoxDecoration(border: Border.all(color: Styles.messageDarkGrey)),
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DecoratedBox(
                        decoration: BoxDecoration(border: Border.all(color: Styles.messageDarkGrey), borderRadius: BorderRadius.all(Radius.circular(7))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextField(
                            controller: controller,
                            decoration: InputDecoration(border: InputBorder.none),
                          ),
                        )),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          if (controller.text.isNotEmpty) {
                            User user = FirebaseAuth.instance.currentUser!;
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text("Mesajın eğitmenimize gönderildi! Cevapladığında mesaj kutunda göreceksin...")));
                            FirebaseFirestore.instance.collection('users').doc(user.uid).set({'firstQuestion': 1, 'point': currentUser!.point + 1}, SetOptions(merge: true));
                          }
                          // messagesRepo.messages.add(MessageModel(controller.text, "me", DateTime.now()));
                        },
                        child: Icon(Icons.send)),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class MessageView extends StatelessWidget {
  final MessageModel message;
  const MessageView(
    this.message, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
        alignment: message.sender == "me" ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(color: Styles.messageLightGrey),
            width: MediaQuery.of(context).size.width - 150,
            child: Text(message.text, style: Styles.messageTextStyle)),
      ),
    );
  }
}
