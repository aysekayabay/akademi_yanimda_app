import 'package:akademi_yanimda/pages/forum_screen.dart';
import 'package:akademi_yanimda/pages/main_page.dart/collections_screen/collection_screen.dart';
import 'package:akademi_yanimda/pages/main_page.dart/lessons_screen/lessons_screen.dart';
import 'package:akademi_yanimda/pages/profile_screen.dart';
import 'package:akademi_yanimda/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeBar extends StatefulWidget {
  final int selectedIndex;
  const HomeBar({super.key, this.selectedIndex = 0});

  @override
  State<HomeBar> createState() => HomeBarState();
}

class HomeBarState extends State<HomeBar> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    LessonsScreen(),
    CollectionScreen(),
    ForumScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
          onTabChange: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          selectedIndex: _selectedIndex,
          gap: 10,
          activeColor: Styles.darkPurp,
          padding: EdgeInsets.all(20),
          tabBackgroundColor: Styles.lightPink,
          tabs: [
            GButton(
              icon: Icons.home_outlined,
              text: "Dersler",
            ),
            GButton(
              icon: Icons.local_attraction_outlined,
              text: "Koleksiyon",
            ),
            GButton(
              icon: Icons.forum_outlined,
              text: "Forum",
            ),
            GButton(
              icon: Icons.person_3_outlined,
              text: "Profil",
            ),
          ],
        ),
      ),
    );
  }
}
