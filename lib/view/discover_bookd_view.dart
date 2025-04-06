import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/constant.dart';
import 'package:graduation_project/cubits/books_cubit/books_cubit.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:graduation_project/view/widgets/customized_text.dart';
import 'package:graduation_project/view/widgets/customized_textfield.dart';
import 'package:graduation_project/view/book_details_view.dart';

class DiscoverBookView extends StatelessWidget {
  DiscoverBookView({super.key});

  @override
  Widget build(BuildContext context) {
    var myCubit = BlocProvider.of<BooksCubit>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomizedText(
            text: S.of(context).Discover_books,
            fontSize: 24,
            color: Colors.white,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomizedTextfield(
            onChanged: (value) {
              if (value.isNotEmpty) {
                myCubit.getBookByNameOrAuthor(key: value);
              }
            },
            title: S.of(context).search_by_book_or_author,
            preffixIcon: Icons.search,
            suffixIcon: Icons.mic,
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<BooksCubit, BooksState>(builder: ((context, state) {
            if (state is BooksInitialState) {
              return Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {
                          myCubit.viewBookPage = myCubit.allBooks[index];
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return BookDetailsView();
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 5,
                                  color: Colors.grey.withOpacity(0.1))
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Hero(
                                tag: myCubit.allBooks[index].title,
                                child: Container(
                                  width: 160,
                                  height: 160,
                                  child: Image(
                                      image: NetworkImage(
                                          '${myCubit.allBooks[index].image.toString()}')),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        "${myCubit.allBooks[index].title.toString()}",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        "${myCubit.allBooks[index].subTitle.toString()}",
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "${myCubit.allBooks[index].price.toString()}\$",
                                  style: TextStyle(
                                      fontSize: 18, color: primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: myCubit.allBooks.length),
              );
            } else if (state is BooksLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else {
              return Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {
                          myCubit.viewBookPage = myCubit.searchedBook[index];
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return BookDetailsView();
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 5,
                                  color: Colors.grey.withOpacity(0.1))
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Hero(
                                tag: myCubit.searchedBook[index].title,
                                child: Container(
                                  width: 160,
                                  height: 160,
                                  child: Image(
                                      image: NetworkImage(
                                          '${myCubit.searchedBook[index].image.toString()}')),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        "${myCubit.searchedBook[index].title.toString()}",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        "${myCubit.searchedBook[index].subTitle.toString()}",
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "${myCubit.searchedBook[index].price.toString()}\$",
                                  style: TextStyle(
                                      fontSize: 18, color: primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: myCubit.searchedBook.length),
              );
            }
          }))
        ],
      ),
    );
  }
}
