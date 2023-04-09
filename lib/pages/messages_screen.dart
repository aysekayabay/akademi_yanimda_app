// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart'

// class messagesPage extends StatefulWidget {
//   const messagesPage ({Key? key}) : super(key: key);
  
//   @override
//   messagesPage createState() ==> messagesPage();
// }
// class messagesPage extends StatefulWidget{
//     @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Mesajlarım')),
//       backgroundColor: Colors.white,
//       body:Column(children:[
//           Expanded(
//             child: ListView.builder(
//               reverse: true,
//         itemBuilder: (context ,Index) {
//           bool benMiyim = Random().nextBool();
//           return Align(
//             alignment: benMiyim ? Alignment.centerRight: Aligment.centerLeft,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal : 8.0, vertical: 16.0),
//               child: DecoratedBox(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(15)),
//                   border: Border.all(color:Colors.transparent,width: 2)
//                       ),
//                   color:Colors.0xffEEF2FF
//                   child: const Padding(
//                     padding: const EdgeInsets.all(24.0),
//                     child: Text('mesaj girilicek'),
//                     )
//                   )
//                 )
//               )
//             }
//           )
//         )
//             DecoratedBox(
//             decoration: BoxDecoration(
//               border: Border.all(),
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: DecoratedBox(
//                     decoration: BoxDecoration(
//                       border:Border.all(),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(25.0)),),)
//                     child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal:16.0),
//                     child: const TextField(
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                             ),
//                           ),
//                         )
//                   )
//               ]
//               )
//                   ),
//                 Padding(
//                   padding: const EdgeInsets.only(right : 10.0),
//                   child: ElevatedButton(onPressed: () {
//                     print('Gönder');
//                   }, 
//                   child: const Text('Gönder')
//                   ),
//                 )
//               ],
//             ),
//           ),
//         }
// }


