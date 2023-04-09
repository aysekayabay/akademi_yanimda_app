import 'dart:math';
import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mesajlarım')),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  reverse: true,
                  itemBuilder: (context, Index) {
                    bool benMiyim = Random().nextBool();
                    return Align(
                        alignment: benMiyim ? Alignment.centerRight : Alignment.centerLeft,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                            child: DecoratedBox(
                                decoration: BoxDecoration(color: Color(0xffEEF2FF), borderRadius: BorderRadius.all(Radius.circular(15)), border: Border.all(color: Colors.transparent, width: 2)),
                                child: const Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Text('mesaj girilicek'),
                                ))));
                  })),
          DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Row(children: [
                Expanded(
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      )),
                )
              ])),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ElevatedButton(
                onPressed: () {
                  print('Gönder');
                },
                child: const Text('Gönder')),
          )
        ],
      ),
    );
  }
}
