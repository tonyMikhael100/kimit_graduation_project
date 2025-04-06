import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/constant.dart';
import 'package:graduation_project/cubits/auth_cubit/auth_cubit.dart';
import 'package:graduation_project/cubits/books_cubit/books_cubit.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:graduation_project/main.dart';
import 'package:graduation_project/view/widgets/customized_text.dart';
import 'package:graduation_project/view/book_details_view.dart';
import 'package:graduation_project/view/cart_view.dart';
import 'package:graduation_project/view/failureView.dart';

class Home extends StatelessWidget {
  Home({super.key});

  List cursorSliderItems = [
    const Image(
        image:
            NetworkImage("https://itbook.store/img/books/9781098104030.png")),
    const Image(
        image:
            NetworkImage("https://itbook.store/img/books/9781098103828.png")),
    const Image(
        image:
            NetworkImage("https://itbook.store/img/books/9781098106225.png")),
    const Image(
        image:
            NetworkImage("https://itbook.store/img/books/9781098106225.png")),
  ];


 

  @override
  Widget build(BuildContext context) {
    var myCubit = BlocProvider.of<BooksCubit>(context);
    var authCubit = BlocProvider.of<AuthCubit>(context);

    return BlocBuilder<BooksCubit, BooksState>(builder: (context, state) {
      if (state is BooksInitialState) {
        return Container(
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.only(top: 40, right: 16, left: 16),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomizedText(
                        text: "BOOKLY", fontSize: 30, color: primaryColor),
                    const SizedBox(
                      width: 20,
                    ),
                    CircleAvatar(
                      backgroundColor: primaryColor,
                      backgroundImage: NetworkImage(authCubit.homeImage),
                      radius: 22,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "${S.of(context).welcome_back_} ${authCubit.homeName}",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  S.of(context).what_do_you_want,
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      viewportFraction: 0.54,
                      enableInfiniteScroll: true,
                      height: MediaQuery.of(context).size.height * 0.32,
                      autoPlay: true,
                      autoPlayAnimationDuration: const Duration(
                        milliseconds: 300,
                      )),
                  items: cursorSliderItems.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          color: Colors.transparent,
                          child: i,
                        );
                      },
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomizedText(
                      text: S.of(context).For_you,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                    TextButton(
                      onPressed: () {
                        myCubit.viewAllButton();
                      },
                      child: Text(
                        S.of(context).view_all,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.44,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 15,
                          );
                        },
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () {
                              myCubit.viewBookPage = myCubit.allBooks[index];
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return BookDetailsView();
                              }));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: myCubit.allBooks[index].title,
                                  child: Container(
                                    width: 160,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(myCubit
                                            .allBooks[index].image
                                            .toString()),
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 160,
                                    child: Text(
                                      softWrap: true,
                                      "${myCubit.allBooks[index].title.toString()}",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "${myCubit.allBooks[index].price.toString()}\$ ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: primaryColor,
                                  ),
                                )
                              ],
                            ),
                          );
                        })),
                  ),
                ),
                CustomizedText(
                  text: S.of(context).New_arrivals,
                  fontSize: 24,
                  color: Colors.white,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.44,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 15,
                          );
                        },
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () {
                              myCubit.viewBookPage = myCubit.newsBooks[index];
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return BookDetailsView();
                              }));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: myCubit.newsBooks[index].title,
                                  child: Container(
                                    width: 160,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              '${myCubit.newsBooks[index].image.toString()}')),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 160,
                                    child: Text(
                                      "${myCubit.newsBooks[index].title.toString()}",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                Text(
                                  "${myCubit.newsBooks[index].price.toString()}",
                                  style: TextStyle(
                                      fontSize: 14, color: primaryColor),
                                )
                              ],
                            ),
                          );
                        })),
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (state is BooksLoadingState) {
        return Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        ));
      } else {
        return FailureView();
      }
    });
  }
}

// InkWell(
                //   onTap: () {
                //     setState(() {
                //       isDark = !isDark;
                //     });
                //   },
                //   child: Container(
                //     width: 70,
                //     height: 30,
                //     alignment: isDark ? Alignment.topLeft : Alignment.topRight,
                //     child: CircleAvatar(
                //       backgroundColor: primaryColor,
                //       child: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
                //     ),
                //     decoration: BoxDecoration(
                //         color: Colors.grey[800],
                //         borderRadius: BorderRadius.circular(15)),
                //   ),
                // ),