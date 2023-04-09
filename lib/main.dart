import 'package:akademi_yanimda/pages/main_page.dart/lessons_screen/lesson_title.dart';
import 'package:akademi_yanimda/pages/main_page.dart/lessons_screen/lessons_screen.dart';
import 'package:akademi_yanimda/pages/splash_screen.dart';
import 'package:akademi_yanimda/pages/main_page.dart/lessons_screen/video_content_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
/*   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Akademi Yanımda',
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                elevation: 0,
                color: Colors.transparent,
                iconTheme: IconThemeData(
                  color: Color(0xff525F7F),
                ))),
        home: LessonsScreen());
  }
}
