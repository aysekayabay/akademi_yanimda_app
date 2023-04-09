import 'package:akademi_yanimda/pages/main_page.dart/lessons_screen/lessons_card.dart';
import 'package:akademi_yanimda/utilities/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LessonsScreen extends StatefulWidget {
  const LessonsScreen({super.key});

  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 80),
          // Search(controller: _controller),
          name(title: user!.displayName!),
          bar(),
          Column(
            children: [
              LessonCard(name_count: 0, arkaplan_rengi: Styles.buttonColor),
              LessonCard(name_count: 1, arkaplan_rengi: Styles.cardBlue),
              LessonCard(name_count: 0, arkaplan_rengi: Styles.cardPinh),
            ],
          )
        ],
      ),
    );
  }

  Padding bar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        constraints: BoxConstraints(minWidth: 300, maxHeight: 5),
        decoration: BoxDecoration(gradient: LinearGradient(stops: [0.2, 0.1], begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Colors.greenAccent, Colors.grey.shade300])),
      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          labelText: "Eğitim ara",
          prefixIcon: Icon(Icons.search),
          labelStyle: GoogleFonts.rubik(
            color: Colors.blueGrey[400],
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class name extends StatelessWidget {
  final String title;
  const name({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.rubik(
                color: Styles.darkGrey,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Kazanılabilir Koleksiyonlar",
              style: GoogleFonts.rubik(
                color: Styles.lightGrey,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        InkWell(
          // onTap: () => Navigator.of(context).push(route),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Styles.baseOrange, shape: BoxShape.circle),
            child: Image(
              image: AssetImage("assets/images/cup.png"),
              height: 40,
              width: 40,
            ),
          ),
        )
      ],
    );
  }
}
