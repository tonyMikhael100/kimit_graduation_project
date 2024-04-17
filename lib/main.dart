import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/apis/api_service.dart';
import 'package:graduation_project/cubit/books_cubit.dart';
import 'package:graduation_project/view/book_details_view.dart';
import 'package:graduation_project/view/home.dart';
import 'package:graduation_project/view/home_view.dart';
import 'package:graduation_project/view/onboarding.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BooksCubit(),
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: HomeView(),
      ),
    );
  }
}
