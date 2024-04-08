import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/constant.dart';
import 'package:graduation_project/view/all_books_view.dart';
import 'package:graduation_project/view/home.dart';
import 'package:graduation_project/widgets/customized_text.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isDark = true;
  int currentIndex = 0;
  List screens = [
    Home(),
    AllBooksView(),
    Home(),
    Home(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.01, 0.5, 0.8],
        colors: [
          const Color(0x09FBD3).withOpacity(0.2),
          Colors.transparent,
          const Color(0x09FBD3).withOpacity(0.2),
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60),
              topRight: Radius.circular(60),
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: BottomNavigationBar(
            onTap: (int index) {
              setState(() {
                currentIndex = index;
                print(currentIndex);
              });
            },
            fixedColor: Colors.white,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.house), label: ""),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.bookOpen), label: ""),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.bookmark), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
            ],
          ),
        ),
        body: screens[currentIndex],
      ),
    );
  }
}
