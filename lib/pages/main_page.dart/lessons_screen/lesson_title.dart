// import 'package:akademi_yanimda/models/lesson_model.dart';
// import 'package:akademi_yanimda/services/card_info.dart';
// import 'package:flutter/material.dart';

// class LessonTitle extends StatelessWidget {
//   Konu konu;
//   LessonTitle({required this.konu});
//   var index;
//   @override
//   Widget build(BuildContext context) {
//     List<Baslik> basliklar = konu.Basliklar;
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           leading: IconButton(
//             icon: Icon(Icons.close),
//             onPressed: () => Navigator.of(context).pop(),
//           )),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "${konu.isim} Eğitimleri",
//                     style: CardInfo.KONU_BASLIK,
//                   )),
//               SizedBox(height: 25),
//               Padding(
//                 padding: const EdgeInsets.only(right: 200),
//                 child: Container(
//                   padding: EdgeInsets.only(bottom: 5),
//                   decoration: BoxDecoration(
//                       border: Border(
//                           bottom:
//                               BorderSide(color: Colors.indigo, width: 1.5))),
//                   child: Text("Eğitimler", style: CardInfo.KONU_BASLIK1),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ListView.builder(
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) {
//                   return titleCard(
//                     baslik: basliklar[index],
//                   );
//                 },
//                 itemCount: basliklar.length,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class titleCard extends StatelessWidget {
//   Baslik baslik;
//   titleCard({
//     super.key,
//     required this.baslik,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       child: Padding(
//         padding: EdgeInsets.all(12),
//         child: ListTile(
//           //leading: CircleAvatar(backgroundImage: AssetImage("assets/images${CardInfo.BASLIK[0]}.jpg"),),
//           onTap: () {},
//           title: Text(baslik.konu.length.toString()),
//           subtitle: Text(
//             baslik.konu,
//             style: CardInfo.KONU_ADI,
//           ),
//           trailing: Icon(Icons.arrow_forward_ios_rounded),
//         ),
//       ),
//     );
//   }
// }
