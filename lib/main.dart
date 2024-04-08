import 'package:flutter/material.dart';
import 'package:graduation_project/view/home.dart';
import 'package:graduation_project/view/home_view.dart';
import 'package:graduation_project/view/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeView(),
    );
  }
}
