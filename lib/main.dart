import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubits/auth_cubit/auth_cubit.dart';
import 'package:graduation_project/cubits/books_cubit/books_cubit.dart';
import 'package:graduation_project/model/book_model.dart';
import 'package:graduation_project/view/authantication_view/sign_in_view.dart';
import 'package:graduation_project/view/authantication_view/sign_up_view.dart';
import 'package:graduation_project/view/home_view.dart';
import 'package:graduation_project/view/onboarding.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

SharedPreferences? sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  sharedPreferences = await SharedPreferences.getInstance();
  await Hive.initFlutter();
  Hive.registerAdapter(BookModelAdapter());
  Box box = await Hive.openBox<BookModel>('books');
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BooksCubit()),
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: MyMaterialApp(),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var myCubit = BlocProvider.of<BooksCubit>(context);
    return BlocBuilder<BooksCubit, BooksState>(builder: ((context, state) {
      return MaterialApp(
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: sharedPreferences == null
            ? Locale('en')
            : Locale('${sharedPreferences!.getString('locale')}'),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: SignInView(),
      );
    }));
  }
}
