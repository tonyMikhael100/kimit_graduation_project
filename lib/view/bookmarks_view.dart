import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/constant.dart';
import 'package:graduation_project/cubits/books_cubit/books_cubit.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:graduation_project/model/book_model.dart';
import 'package:graduation_project/view/widgets/customized_book_view_model.dart';
import 'package:graduation_project/view/widgets/customized_text.dart';
import 'package:graduation_project/view/book_details_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BookmarkView extends StatefulWidget {
  BookmarkView({super.key});

  @override
  State<BookmarkView> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
  @override
  Widget build(BuildContext context) {
    var myCubit = BlocProvider.of<BooksCubit>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomizedText(
                text: S.of(context).Bookmarks,
                fontSize: 24,
                color: Colors.white,
              ),
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title:
                                Text(S.of(context).sure_want_to_delet_bookmark),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(S.of(context).no)),
                              TextButton(
                                  onPressed: () {
                                    myCubit.deleteAllbookmarks();
                                    Navigator.pop(context);
                                  },
                                  child: Text(S.of(context).yes)),
                            ],
                          );
                        });
                  },
                  icon: FaIcon(FontAwesomeIcons.trash))
            ],
          ),
          Expanded(
            child: ValueListenableBuilder<Box<BookModel>>(
              valueListenable: Hive.box<BookModel>('books').listenable(),
              builder: (context, Box<BookModel> box, child) {
                return ListView.builder(
                    itemCount: box.length,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {
                          myCubit.viewBookPage = box.getAt(index);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return BookDetailsView();
                          }));
                        },
                        child: Slidable(
                          key: const ValueKey(0),
                          // The start action pane is the one at the left or the top side.
                          endActionPane: ActionPane(
                            // A motion is a widget used to control how the pane animates.
                            motion: const ScrollMotion(),
                            children: [
                              // A SlidableAction can have an icon and/or a label.
                              SlidableAction(
                                onPressed: (value) {
                                  myCubit.deleteSpecificBookFromBookmark(index);
                                },
                                backgroundColor: primaryColor,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: S.of(context).delete,
                              ),
                              SlidableAction(
                                onPressed: (value) {},
                                backgroundColor: Color(0xFF21B7CA),
                                foregroundColor: Colors.white,
                                icon: Icons.share,
                                label: S.of(context).share,
                              ),
                            ],
                          ),
                          child: CustomizedBookViewModel(
                            bookName: "${box.getAt(index)!.title}",
                            description: "${box.getAt(index)!.subTitle} ",
                            image: "${box.getAt(index)!.image}",
                            price: "${box.getAt(index)!.price}",
                          ),
                        ),
                      );
                    }));
              },
            ),
          )
        ],
      ),
    );
  }
}
