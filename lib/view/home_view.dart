import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/constant.dart';
import 'package:graduation_project/cubits/books_cubit/books_cubit.dart';
import 'package:graduation_project/view/bookmarks_view.dart';
import 'package:graduation_project/view/cart_view.dart';
import 'package:graduation_project/view/discover_bookd_view.dart';
import 'package:graduation_project/view/home.dart';
import 'package:graduation_project/model/widgets/customized_text.dart';
import 'package:graduation_project/view/settings_view.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var myCubit = BlocProvider.of<BooksCubit>(context);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: const [0.1, 0.6, 0.8],
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
              myCubit.changeScreen(index);
            },
            fixedColor: Colors.white,
            // selectedItemColor: primaryColor,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.house), label: ""),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.bookOpen), label: ""),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.bookmark), label: ""),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.bagShopping), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
            ],
          ),
        ),
        body: myCubit.screens[myCubit.currentIndex],
      ),
    );
  }
}
