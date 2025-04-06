import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/constant.dart';
import 'package:graduation_project/cubits/books_cubit/books_cubit.dart';
import 'package:graduation_project/main.dart';
import 'package:graduation_project/model/widgets/customized_elevatedbutton.dart';
import 'package:graduation_project/model/widgets/customized_text.dart';

import '../generated/l10n.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var myCubit = BlocProvider.of<BooksCubit>(context);
    return BlocListener<BooksCubit, BooksState>(
      listener: (context, state) {
        if (state is BooksAddBeforeMsgState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("${state.errMsg}")));
        }
      },
      child: Container(
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
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: sharedPreferences!.getString('locale') == 'en'
                      ? FaIcon(FontAwesomeIcons.arrowLeft)
                      : FaIcon(FontAwesomeIcons.arrowRight)),
              actions: [
                IconButton(
                    onPressed: () {
                      myCubit.addToFavBook(myCubit.viewBookPage!);
                    },
                    icon: const FaIcon(FontAwesomeIcons.bookmark))
              ],
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    Center(
                      child: Container(
                        height: 300,
                        child: Hero(
                          tag: '${myCubit.viewBookPage!.title}',
                          child: Image(
                              image: NetworkImage(
                                  '${myCubit.viewBookPage!.image.toString()}')),
                        ),
                      ),
                    ),
                    Center(
                      child: CustomizedText(
                        text: "${myCubit.viewBookPage!.title.toString()}",
                        fontSize: 18,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        SizedBox(
                          width: 10,
                        ),
                        CustomizedText(
                            text: "4.0", fontSize: 16, color: Colors.yellow)
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomizedText(
                        text: S.of(context).About_the_book,
                        fontSize: 22,
                        color: Colors.white),
                    Text(
                      "${myCubit.viewBookPage!.subTitle.toString()}",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomizedText(
                        text: S.of(context).Overviw,
                        fontSize: 22,
                        color: Colors.white),
                    Text(
                      "description of the ${myCubit.viewBookPage!.title} is ${myCubit.viewBookPage!.subTitle.toString()}",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustoomizedElevatedButton(
                          width: MediaQuery.of(context).size.width*0.4,
                          onPressed: () {
                            myCubit.launchUrlInWebView(
                                url: myCubit.viewBookPage!.url);
                          },
                          text: S.of(context).Read_details,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            myCubit.addToCart(myCubit.viewBookPage!);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                S.of(context).Add_to_cart,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "${myCubit.viewBookPage!.price.toString()}\$",
                                style: TextStyle(color: primaryColor),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.5, 55),
                            backgroundColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
