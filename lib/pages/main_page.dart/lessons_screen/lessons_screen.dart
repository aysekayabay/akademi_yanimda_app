import 'package:akademi_yanimda/pages/main_page.dart/lessons_screen/lessons_card.dart';
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
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Search(controller: _controller),
              name(),
              bar(),
              Column(
                children: [
                  LessonCard(name_count: 0,arkaplan_rengi: Colors.indigoAccent),
                  LessonCard(name_count: 1,arkaplan_rengi: Colors.lightGreen),
                  LessonCard(name_count: 0,arkaplan_rengi: Colors.tealAccent),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding bar() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: 50,
        constraints: BoxConstraints(minWidth: 300, maxHeight: 5),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                stops: [0.2, 0.1],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.greenAccent, Colors.grey.shade300])),
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
  const name({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(
        Icons.price_change,
        size: 45,
      ),
      title: Text(
        "Ali Osman Yalçın",
        style: GoogleFonts.rubik(
          color: Colors.blueGrey[700],
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        "Kazanablir Koleksiyonlar",
        style: GoogleFonts.rubik(
          color: Colors.blueGrey[300],
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
