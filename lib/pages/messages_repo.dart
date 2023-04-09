import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/message_model.dart';

class MessagesRepo extends ChangeNotifier {
  final List<MessageModel> messages = [
    MessageModel("Akademi'ye hoş geldin! İlk sorunu sorduğunda 1 puan kazanacaksın!", "O", DateTime.now().subtract(Duration(minutes: 5))),
  ];
}

final messagesProvider = ChangeNotifierProvider(
  (ref) {
    return MessagesRepo();
  },
);

class NewMessageCount extends StateNotifier<int> {
  NewMessageCount(super.state);

  void reset() {
    state = 0;
  }
}

final NewMessageCountProvider = StateNotifierProvider<NewMessageCount, int>((ref) {
  return NewMessageCount(4);
});
