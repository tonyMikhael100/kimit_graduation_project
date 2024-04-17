import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/constant.dart';
import 'package:graduation_project/cubit/books_cubit.dart';
import 'package:graduation_project/model/widgets/customized_elevatedbutton.dart';
import 'package:graduation_project/model/widgets/customized_text.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var myCubit = BlocProvider.of<BooksCubit>(context);
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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: FaIcon(FontAwesomeIcons.arrowLeft)),
            actions: [
              IconButton(
                  onPressed: () {},
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
                  const CustomizedText(
                      text: "About the book",
                      fontSize: 22,
                      color: Colors.white),
                  Text(
                    "${myCubit.viewBookPage!.subTitle.toString()}",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomizedText(
                      text: "Overview", fontSize: 22, color: Colors.white),
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
                        onPressed: () {
                          myCubit.launchUrlInWebView(
                              url: myCubit.viewBookPage!.url);
                        },
                        text: "Read details",
                      ),
                      ElevatedButton(
                        onPressed: () {
                          myCubit.addToCart(myCubit.viewBookPage!);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Add to cart ",
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
                          fixedSize:
                              Size(MediaQuery.of(context).size.width * 0.5, 55),
                          backgroundColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
